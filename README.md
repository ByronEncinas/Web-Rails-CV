# Initialized Rails Project

- [ ] [Create simple BlogPost Model with no styles](https://www.youtube.com/watch?v=wSNTT8MLI90&t=1s)

Minuto  / 3:27:26

## Steps taken (part 2)

Entrar a http://localhost:3000/bienvenidos en nuestro navegador (nuestra unica ruta a index debe ser get '/bienvenidos', to: 'home#index').

Esta página nos mostrará lo siguiente.

    Home#index
    Find me in app/views/home/index.html.erb

A website has to have somewhere to store data. In this case we have to set up a model (Database) in which all the information needed is going to be inserted in to this database via Rails.

Command is on the form of

    rails generate model <dbname> <column1>:<type> <column2>:<type>

in our case, we will create a model like

    rails generate model Article title:string status:integer

Database: Article

|article_id | title                    | status     | created_at | updated_at |
|           | :---                     |       ---: |            |            |
| 1         | My first Rails Article   | 0          |            |            |
| 2         | Second Rails Article     | 1          |            |            |

Where it is important to clarify, Rails creates "article_id", "created_at" and "updated_at" columns for every table you create, in that case we already initialized a primary key for this table. Which is great!

The output is:

    ~/SweetHome/rails_projects/Web-Rails-CV$ rails generate model Article title:string status:integer
        invoke  active_record
        create    db/migrate/20230819195111_create_articles.rb
        create    app/models/article.rb
        invoke    test_unit
        create      test/models/article_test.rb
        create      test/fixtures/articles.yml

Por ahora, la estructura de la base de datos existe en db/migrate/20230819195111_create_articles.rb, aun no en el server de psql.

Para que la estructura migre de Rails a PostgreSQL usaremos el siguiente comando

    ~/SweetHome/rails_projects/Web-Rails-CV$ rails db:migrate
    == 20230819195111 CreateArticles: migrating ===================================
    -- create_table(:articles)
    -> 0.0262s
    == 20230819195111 CreateArticles: migrated (0.0263s) ==========================

Para deshacer la migración, se puede usar 

    ~/SweetHome/rails_projects/Web-Rails-CV$ rails db:rollback

Pero aqui no lo vamos a hacer

Vamos a construir un controlador especifico para el modelo article

    ~/SweetHome/rails_projects/Web-Rails-CV$ rails generate controller Articles
      create  app/controllers/articles_controller.rb
      invoke  erb
      create    app/views/articles
      invoke  test_unit
      create    test/controllers/articles_controller_test.rb
      invoke  helper
      create    app/helpers/articles_helper.rb
      invoke    test_unit

Pero un sitio web tipo foro, necesita acciones para crear nuevos articulos, editarlos, destruirlos, etc.
Así que vamos a empezar a añadir funciones de este tipo dentro del controlador articles_controller.rb

    class ArticlesController < ApplicationController
        def new
        end
        def create
        end
    end

Pero, queremos editar en una nueva página, asi que la acción "new" debe ocurrir en un nuevo lugar dentro de nuestra página, así que construiremos el archivo new.html.erb, que va a contener un formulario donde se nos pedirán los datos de articulo.

La función new, tendrá una variable que contendrá los datos del modelo articles. (recordemos que el '@' dentro una función hace que la variable sea local dentro de dicha función; '@@' hace lo mismo pero es local en toda la clase)

    class ArticlesController < ApplicationController
        def new
            # nos permite guardar nueva información en la variable desde new.html.erb
            @article = Article.new
        end
        def create
        end
    end

Ahora, vamos a ir a new.html.erb para crear un formulario (forms) que ruby ya tiene definido.
Comment: the following form prepares to locate labels iteratively 

    <h2> New Article </h2>
    <%= form_with(model: @article) do |form| %>
        <div>
            <%= form.label :title %>
            <%= form.text_field :title %>
        </div>
    <% end %>

But since by this time we don't have data in our model, it will only display "New Article" or it will crash.
This because we need to set up a article_path

We go to routes.rb and update the path to make sure the creation default ruby function allows us to create the entry of data through that html.erb and also to publish it.

    get "articles/new", to: "articles#new"
    post "articles", to: "articles#create"

but wow! You can't submit it, don't you? This is because we forgot the form.submit button.

    <div>
    <%= form.submit %>
    </div>

Adding this below the form should work out, maybe also updating the form_with() like

    <%= form_with(model: @article, local: true) do |form| %>

where the local: true is just overstating because local is true by default (just recently has local been true by default that's why I add it)

And also we need to make the form.submit, publish the changes using the create function in out articles_controller.

For now let's see. I can do more, I'll just make a map of the result.

- [x] Created http://localhost:3000/ & http://localhost:3000/articles as homepage
- [x] added functionality :resources
- [x] Installed TailwindCSS
