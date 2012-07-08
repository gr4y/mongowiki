class ArticlesController < Happy::Controller
  
  set :root, File.expand_path('../..', File.dirname(__FILE__))
  set :views, File.join(settings[:root], 'views')
  
  helpers Helpers

  def route
    layout 'layout.erb'

    on('list') { list_articles }
    
    on('new') { new_article }
    
    on_post('create') { create_article(params[:article]) }
    
    on('show') do
      on(':id') do
        on('/') { show_article(params[:id]) }
        on('diff') do
          on(':version') { diff_article(params[:id], params[:version].to_i) }
        end
      end
    end
        
    on('edit') do
      on(':id') { edit_article(params[:id]) }
    end
    
    on_post('update') { update_article(params[:id], params[:article])  }
    
    on('destroy') do
      on(':id') { destroy(params[:id]) }
    end
    
    redirect! '/list'
  end
    
  def list_articles
    @articles = Article.all
    if @articles.count >= 1
      render 'article/list.erb'
    else
      @message = "There are no articles yet!"
      render 'error'
    end
  end
  
  def show_article(id)
    begin
      @article = Article.find(id)
      render 'article/show.erb'
    rescue Mongoid::Errors::DocumentNotFound => e
      @error = e
      render 'error.erb'
    end
  end
  
  def diff_article(id, version) 
    begin
      @article = Article.find(id)
      @title_diff = @article.diff(version, :title)
      @text_diff = @article.diff(version, :text)
      render 'article/diff.erb'
    rescue Mongoid::Errors::DocumentNotFound => e
      @error = e 
      render 'error.erb'
    end
  end
  
  def new_article
    @article = Article.new
    render 'article/new.erb'
  end
  
  def create_article(article)
    @article = Article.create(article)
    if !@article.valid?
      redirect! current_url("/new")
    end
    redirect! current_url("/show/#{@article._id}")
  end
  
  def edit_article(id)
    @article = Article.find(id)
    render 'article/edit.erb'
  end
  
  def update_article(id, article)
    @article = Article.find(id)
    @article.update_attributes(article)
    if @article.save
      redirect! current_url("/show/#{@article._id}")
    end
  end
  
  def destroy(id)
    @article = Article.find(id)
    if @article.delete
      redirect url("/list")
    end
  end
  
end