# Todo App 📝

A clean and intuitive task management application built with Ruby on Rails. Organize your tasks into categories, set priorities, add deadlines, and track your progress efficiently.

![Rails Version](https://img.shields.io/badge/Rails-5.1.7-red)
![Ruby Version](https://img.shields.io/badge/Ruby-2.4.1-red)
![License](https://img.shields.io/badge/license-MIT-green)

## Features ✨

- **Category Management**: Organize tasks into custom lists (Work, Personal, Shopping, etc.)
- **Task Properties**:
  - Title and description
  - Priority levels (Low, Medium, High) with color-coded badges
  - Due dates with overdue indicators
  - Completion status tracking
- **User Interface**:
  - Clean, responsive Bootstrap 4 design
  - Collapsible task descriptions
  - One-click task completion toggle
  - Quick task creation from dashboard
- **Task Operations**:
  - Create, read, update, and delete tasks
  - Mark tasks as complete/incomplete
  - View task timestamps and age

## Screenshots 📸

### Dashboard View
View all your task lists at a glance with task counts and completion status.

### Task List View
Manage tasks within a category with priority badges, deadlines, and descriptions.

## Tech Stack 🛠️

- **Backend**: Ruby on Rails 5.1.7
- **Database**: SQLite3
- **Frontend**: 
  - Bootstrap 4
  - Font Awesome icons
  - Custom CSS
- **Ruby Version**: 2.4.1

## Installation 🚀

### Prerequisites

- Ruby 2.4.1
- Rails 5.1.7
- SQLite3
- Bundler

### Setup Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/prab0007al/todo_app.git
   cd todo_app
   ```

2. **Install dependencies**
   ```bash
   bundle install
   ```

3. **Setup database**
   ```bash
   rails db:create
   rails db:migrate
   ```

4. **Start the server**
   ```bash
   rails server
   ```

5. **Visit the application**
   ```
   Open your browser and navigate to: http://localhost:3000
   ```

## Usage 💡

### Creating a Category (List)

1. Click "New List" button on the homepage
2. Enter a category name (e.g., "Work", "Personal", "Shopping")
3. Click "Create List"

### Adding Tasks

**Method 1: Quick Add (from Dashboard)**
- Enter task title on the homepage
- Select priority (optional)
- Click "Add Task"
- Task will be added to "Miscellaneous" category

**Method 2: Add to Specific Category**
1. Click on a category to view it
2. Fill in task details:
   - Task title (required)
   - Description (optional)
   - Priority: Low, Medium, or High
   - Due date (optional)
3. Click "Add Task"

### Managing Tasks

- **Complete Task**: Click the checkbox next to the task
- **View Description**: Click "Details" button to expand/collapse
- **Delete Task**: Click the red "Delete" button

### Managing Categories

- **View Category**: Click on category name
- **Edit Category**: Click "Edit" button on category card
- **Delete Category**: Click "Delete" button (will delete all tasks in that category)

## Database Schema 📊

### Categories Table
- `id` (integer)
- `title` (string)
- `created_at` (datetime)
- `updated_at` (datetime)

### Todos Table
- `id` (integer)
- `title` (string)
- `description` (text)
- `priority` (string) - 'low', 'medium', 'high'
- `deadline` (datetime)
- `is_completed` (boolean)
- `category_id` (integer, foreign key)
- `created_at` (datetime)
- `updated_at` (datetime)

## Project Structure 📁

```
todo_app/
├── app/
│   ├── controllers/
│   │   ├── categories_controller.rb
│   │   └── todos_controller.rb
│   ├── models/
│   │   ├── category.rb
│   │   └── todo.rb
│   └── views/
│       ├── categories/
│       │   ├── index.html.erb
│       │   ├── show.html.erb
│       │   ├── new.html.erb
│       │   └── edit.html.erb
│       └── layouts/
│           └── application.html.erb
├── config/
│   └── routes.rb
├── db/
│   ├── migrate/
│   └── schema.rb
└── README.md
```

## API Routes 🛣️

```
Root Path:
  GET  /                          # Dashboard (categories#index)

Categories:
  GET    /categories              # List all categories
  GET    /categories/new          # New category form
  POST   /categories              # Create category
  GET    /categories/:id          # Show category with tasks
  GET    /categories/:id/edit     # Edit category form
  PATCH  /categories/:id          # Update category
  DELETE /categories/:id          # Delete category

Todos:
  POST   /categories/:category_id/todos       # Create task in category
  PATCH  /categories/:category_id/todos/:id   # Update task
  DELETE /categories/:category_id/todos/:id   # Delete task
  POST   /todos                                # Quick create task
```

## Development 🔧

### Running Tests
```bash
rails test
```

### Database Commands
```bash
# Create database
rails db:create

# Run migrations
rails db:migrate

# Rollback migration
rails db:rollback

# Reset database
rails db:drop db:create db:migrate

# Open Rails console
rails console
```

### Code Structure

**Models:**
- `Category`: Has many todos (dependent destroy)
- `Todo`: Belongs to category, validates title presence

**Controllers:**
- `CategoriesController`: CRUD operations for categories
- `TodosController`: CRUD operations for todos, nested under categories

## Known Issues & Future Enhancements 🔮

### Future Features
- [ ] User authentication and authorization
- [ ] Task sharing between users
- [ ] Task search and filtering
- [ ] Task tags/labels
- [ ] Task sorting options
- [ ] Recurring tasks
- [ ] Task reminders/notifications
- [ ] Export tasks to CSV/JSON
- [ ] Dark mode toggle
- [ ] Mobile app version

### Current Limitations
- Single-user application (no authentication)
- No task search functionality
- No task archiving feature
- No file attachments for tasks

## Contributing 🤝

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License 📄

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Author ✍️

**Prabal Thool**
- GitHub: [@prab0007al](https://github.com/prab0007al)
- Project Link: [https://github.com/prab0007al/todo_app](https://github.com/prab0007al/todo_app)

## Acknowledgments 🙏

- Bootstrap 4 for the responsive UI framework
- Font Awesome for icons
- Ruby on Rails community for excellent documentation

---

Made with ❤️ by Prabal Thool