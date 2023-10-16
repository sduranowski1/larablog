<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="icon" href="images/favicon.ico" />
        <link
            rel="stylesheet"
            {{-- href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" --}}
            href="C:\xampp\htdocs\larabeats_2.0\resources\css\app.css"
            integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
        />
        <script src="//unpkg.com/alpinejs" defer></script>
        <script src="https://cdn.tailwindcss.com"></script>
        <style>
            body {
                background: repeating-linear-gradient(
                    to right,
                    #F9FAFB,
                    #F9FAFB 3px,
                    #F3F4F6 4px,
                    #F3F4F6 7px
                );
            }
            /* .shadow {
                box-shadow: inset 0 0 10px #000000;
            } */
                
        </style>
        <script>

            tailwind.config = {
                theme: {
                    extend: {
                        colors: {
                            laravel: "#aa9a52",
                            // stripesbg: repeating-linear-gradient(
                            //     "to right",
                            //     "#f6ba52",
                            //     "#f6ba52 10px",
                            //     "#ffd180 10px",
                            //     "#ffd180 20px"
                            // );
                        },
                    },
                },
            };
        </script>
        <title>LaraGigs | Find Laravel Jobs & Projects</title>
    </head>
    <body class="mb-48 bg-stripes">
    {{-- <body class="mb-48 bg-gradient-to-r from-gray-50 to-gray-200"> --}}
        <nav class="flex justify-between items-center mb-4">
            <a href="/"
                ><img class="pl-4" src="{{asset('images/logo.png')}}" alt="" class="logo"
            /></a>
            <ul class="flex space-x-6 mr-6 text-lg">
                @auth
                <li>
                    <span class="font-bold uppercase">
                        Welcome {{auth()->user()->name}}
                    </span>
                </li>
                <li>
                    <a href="/users" class="hover:text-laravel">
                        Authors
                    </a>
                </li>
                <li>
                    <a href="/listings/manage" class="hover:text-laravel"
                        ><i class="fa-solid fa-gear"></i>
                         Manage Listings</a
                    >
                </li>
                <li>
                    <form class="inline" method="POST" action="/logout">
                        @csrf
                        <button type="submit">
                            <i class="fa-solid fa-door-closed"></i>Logout
                        </button>
                    </form>
                </li>
                @else
                <li>
                    <a href="/register" class="hover:text-laravel"
                        ><i class="fa-solid fa-user-plus"></i> Register</a
                    >
                </li>
                <li>
                    <a href="/login" class="hover:text-laravel"
                        ><i class="fa-solid fa-arrow-right-to-bracket"></i>
                         Login</a
                    >
                </li>
                @endauth
            </ul>
        </nav>
        <main>
        {{-- VIEW OUTPUT --}}
        {{$slot}}
        </main>
        <footer
            class="fixed bottom-0 left-0 w-full flex items-center justify-start font-bold bg-laravel text-white h-24 mt-24 opacity-90 md:justify-center"
        >
            <p class="ml-2">Copyright &copy; 2023, All Rights reserved</p>

            <a
                href="/listings/create"
                class="absolute top-1/3 right-10 bg-black text-white py-2 px-5"
                >Share your recipe</a
            >
        </footer>
        <x-flash-message />
    </body>
</html>