require 'rails_helper'

RSpec.feature "Task management", type: :feature do
  scenario "User creates a new task" do
    visit new_task_path  

    fill_in 'Título', with: 'Mi nueva tarea'  
    check 'Completada'  
    click_button 'Crear Tarea' 

    expect(page).to have_content 'Tarea creada exitosamente'  
    
    expect(page).to have_content 'Mi nueva tarea'  
  end
end
