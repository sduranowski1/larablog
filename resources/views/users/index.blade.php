<x-layout>

    @section('content')
    @include('partials._hero')
    @include('partials._search')
    
    <div class="lg:grid lg:grid-cols-2 gap-4 space-y-4 md:space-y-0 mx-4">
    
    @if(count($users) == 0)
    <p>No Users found</p>
    @endif
    
    @foreach($users as $user)
        <x-user-card :user="$user" />
    @endforeach
    
    </div>
    

 
    </x-layout>