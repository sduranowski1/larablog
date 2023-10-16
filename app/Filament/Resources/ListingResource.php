<?php

namespace App\Filament\Resources;

use Filament\Forms;
use Filament\Tables;
use App\Models\Listing;
use Filament\Forms\Form;
use Filament\Tables\Table;
use Filament\Resources\Resource;
use Filament\Tables\Columns\TextColumn;
use Filament\Forms\Components\TextInput;
use Illuminate\Database\Eloquent\Builder;
use App\Filament\Resources\ListingResource\Pages;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use App\Filament\Resources\ListingResource\RelationManagers;
use Filament\Forms\Components\Select;
use App\Models\User;

class ListingResource extends Resource
{
    protected static ?string $model = Listing::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                //
                TextInput::make('id'),
                TextInput::make('user_id'),
                // TextInput::make('category_id'),                
                TextInput::make('title'),
                // TextInput::make('email'),
                // TextInput::make('company'),
                // TextInput::make('location'),
                // TextInput::make('website'),
                // TextInput::make('tags'),
                TextInput::make('description'),
                Select::make('category')
                    ->relationship('category', 'name')
                    ->required()
                    ->preload()

            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                //
                TextColumn::make('id'),
                TextColumn::make('title'),
                // TextColumn::make('email'),
                // TextColumn::make('company'),
                // TextColumn::make('location'),
                // TextColumn::make('website'),
                // TextColumn::make('tags'),
                TextColumn::make('category_id'),
            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ])
            ->emptyStateActions([
                Tables\Actions\CreateAction::make(),
            ]);
    }
    
    public static function getRelations(): array
    {
        return [
            //
        ];
    }
    
    public static function getPages(): array
    {
        return [
            'index' => Pages\ListListings::route('/'),
            'create' => Pages\CreateListing::route('/create'),
            'edit' => Pages\EditListing::route('/{record}/edit'),
        ];
    }    
}
