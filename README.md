# Initialized Rails Project

- [ ] [Create simple BlogPost Model with no styles](https://www.youtube.com/watch?v=wSNTT8MLI90&t=1s)

Minuto 16:52 / 3:27:26

## Steps taken (part 1)

Use *bundle install* if there is any dependency missing or deprecated

- Uno de los primeros pasos es crear una página de inicio que no sea la que está por defecto con el círculo rojo de **Rails**. Así que, para eso, tenemos que crear una nueva ruta

en ./config/routes.rb podemos añadir:

    get "/home", to: "home#index"

sin embargo, esta pagina, como todas, debe contar con un controlador así que debemos crear el siguiente archivo (dada la convención de usar el {nombre}#index para nombrar el controlador nuevo):
        
     ./app/controller/home_controller.rb

This file must come with a class HomeController (due to convention: [class] NameController => [Filename] name_controller.rb)

and inside said class, there will be an action or function called index.

    def HomeController < ApplicationController
        def index
        end
    end

Esto nos dice que un controlador, puede manejar varias paginas de un solo sitio web.

- Must note that the previous way is not the most efficient way to create a controller. We can use ruby generate method to do that

    rails generate controller home index

which will create other helper methods such a test, stylesheets that we might not use but are either way part of the *convention over configuration*. The result of the generate controller command will respond as this.

    Web-Rails-CV $ rails g controller Home index
        create  app/controllers/home_controller.rb
        route  get 'home/index'
        invoke  erb
        create    app/views/home
        create    app/views/home/index.html.erb
        invoke  test_unit
        create    test/controllers/home_controller_test.rb
        invoke  helper
        create    app/helpers/home_helper.rb
        invoke    test_unit

Were we can see the creation of the route and the controller, also index.html.erb which is the page that the index will be rendering. From the fifth line on those are things we might not use much.

- Una vez realizado todo esto, podemos usar

    rails server

o

    rails s

y entrar a http://localhost:3000/bienvenidos en nuestro navegador (nuestra unica ruta a index debe ser get '/bienvenidos', to: 'home#index').

Esta página nos mostrará lo siguiente.

    Home#index
    Find me in app/views/home/index.html.erb
