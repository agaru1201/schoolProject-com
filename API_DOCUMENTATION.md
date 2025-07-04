# Spring 3 MVC Application - API Documentation

## Project Overview

**Spring3Example** is a comprehensive Spring 3 MVC web application demonstrating various form handling patterns, validation, file upload functionality, and authentication mechanisms. The application showcases best practices for building web applications using Spring Framework 3.0.

### Technology Stack
- **Framework**: Spring 3.0 MVC
- **Validation**: Hibernate Validator with Bean Validation (JSR-303)
- **View Technology**: JSP with Spring Tag Libraries
- **File Upload**: Apache Commons FileUpload
- **Build Tool**: Eclipse Project with Java EE support

---

## Application Structure

```
src/net/roseindia/
├── controllers/     # Spring MVC Controllers
│   ├── HelloWorldController.java
│   ├── LoginController.java
│   ├── RegistrationController.java
│   ├── RegistrationValidation.java
│   ├── SimpleFormController.java
│   ├── UploadFileController.java
│   ├── UploadFileIndexController.java
│   └── ValidationController.java
└── form/           # Model/Form Classes
    ├── LoginForm.java
    ├── Registration.java
    ├── UploadItem.java
    ├── User.java
    └── ValidationForm.java

WebContent/
├── index.jsp       # Main landing page
└── WEB-INF/
    ├── views/      # JSP view templates
    ├── web.xml     # Servlet configuration
    ├── dispatcher-servlet.xml  # Spring configuration
    └── messages.properties     # Validation messages
```

---

## Controllers API Reference

### 1. HelloWorldController

**Package**: `net.roseindia.controllers`

Simple demonstration controller showing basic Spring MVC functionality.

#### Endpoints

##### GET /forms/helloworld
- **Description**: Displays a simple "Hello World" message
- **Parameters**: None
- **Returns**: ModelAndView with message
- **View**: `helloworld.jsp`

**Example Usage**:
```
GET http://localhost:8080/Spring3Example/forms/helloworld.html
```

**Response**: Renders the hello world page with the message "Hello World, Spring 3.0!"

---

### 2. LoginController

**Package**: `net.roseindia.controllers`

Handles user authentication with form validation.

#### Endpoints

##### GET /forms/loginform.html
- **Description**: Displays the login form
- **Parameters**: None
- **Returns**: Login form view with empty LoginForm model
- **View**: `loginform.jsp`

##### POST /forms/loginform.html
- **Description**: Processes login form submission
- **Parameters**: 
  - `loginForm` (LoginForm): Form data with username and password
- **Validation**: JSR-303 validation applied
- **Returns**: Success page on valid credentials, form page on errors
- **View**: `loginsuccess.jsp` (success) or `loginform.jsp` (error)

**Default Credentials**:
- **Username**: UserName
- **Password**: password

**Example Usage**:
```javascript
// Form submission
POST /forms/loginform.html
Content-Type: application/x-www-form-urlencoded

userName=UserName&password=password
```

---

### 3. RegistrationController

**Package**: `net.roseindia.controllers`

Manages user registration with comprehensive validation.

#### Dependencies
- `RegistrationValidation`: Custom validator component

#### Endpoints

##### GET /forms/registrationform.html
- **Description**: Displays the registration form
- **Parameters**: None
- **Returns**: Registration form view with empty Registration model
- **View**: `registrationform.jsp`

##### POST /forms/registrationform.html
- **Description**: Processes registration form submission
- **Parameters**: 
  - `registration` (Registration): Form data with user details
- **Validation**: JSR-303 + custom validation
- **Returns**: Success page on valid data, form page on errors
- **View**: `registrationsuccess.jsp` (success) or `registrationform.jsp` (error)

**Example Usage**:
```javascript
// Form submission
POST /forms/registrationform.html
Content-Type: application/x-www-form-urlencoded

userName=john_doe&password=secret123&confirmPassword=secret123&email=john@example.com
```

---

### 4. SimpleFormController

**Package**: `net.roseindia.controllers`

Demonstrates basic form handling without validation.

#### Endpoints

##### GET /forms/simpleForm.html
- **Description**: Displays a simple user form
- **Parameters**: None
- **Returns**: Simple form view with empty User model
- **View**: `simpleForm.jsp`

##### POST /forms/formoutput.html
- **Description**: Processes simple form submission
- **Parameters**: 
  - `user` (User): Form data with user information
- **Validation**: None
- **Returns**: Form output page displaying submitted data
- **View**: `formoutput.jsp`

**Example Usage**:
```javascript
// Form submission
POST /forms/formoutput.html
Content-Type: application/x-www-form-urlencoded

userName=jane_doe&email=jane@example.com
```

---

### 5. ValidationController

**Package**: `net.roseindia.controllers`

Demonstrates comprehensive form validation using Bean Validation.

#### Endpoints

##### GET /forms/validationform.html
- **Description**: Displays the validation form
- **Parameters**: None
- **Returns**: Validation form view with empty ValidationForm model
- **View**: `validationform.jsp`

##### POST /forms/validationform.html
- **Description**: Processes validation form submission
- **Parameters**: 
  - `validationForm` (ValidationForm): Form data with validation constraints
- **Validation**: JSR-303 validation with custom messages
- **Returns**: Success page on valid data, form page on errors
- **View**: `validationsuccess.jsp` (success) or `validationform.jsp` (error)

**Example Usage**:
```javascript
// Form submission
POST /forms/validationform.html
Content-Type: application/x-www-form-urlencoded

userName=testuser&age=25&password=pass123
```

---

### 6. UploadFileController

**Package**: `net.roseindia.controllers`

Handles file upload functionality with size restrictions.

#### Configuration
- **Maximum File Size**: 10,000 bytes (10KB)
- **Upload Directory**: `/images/` (relative to web app root)

#### Endpoints

##### GET /forms/uploadfile
- **Description**: Displays the file upload form
- **Parameters**: None
- **Returns**: File upload form view with empty UploadItem model
- **View**: `uploadfile.jsp`

##### POST /forms/uploadfile
- **Description**: Processes file upload
- **Parameters**: 
  - `uploadItem` (UploadItem): Form data with file information
- **Validation**: File size validation (max 10KB)
- **Returns**: Redirects to upload index page on success
- **Redirect**: `/forms/uploadfileindex`

**File Upload Process**:
1. Validates file size (must be ≤ 10KB)
2. Saves file to `/images/` directory
3. Stores filename in session
4. Redirects to confirmation page

**Example Usage**:
```javascript
// Multipart form submission
POST /forms/uploadfile
Content-Type: multipart/form-data

// Form data with file attachment
filename=document.pdf
fileData=[binary file data]
```

---

### 7. UploadFileIndexController

**Package**: `net.roseindia.controllers`

Displays file upload confirmation and manages upload index page.

#### Endpoints

##### GET /forms/uploadfileindex
- **Description**: Displays the upload confirmation page
- **Parameters**: None
- **Returns**: Upload index view
- **View**: `uploadfileindex.jsp`

##### POST /forms/uploadfileindex
- **Description**: Processes upload index form (placeholder)
- **Parameters**: None
- **Returns**: Upload index view
- **View**: `uploadfileindex.jsp`

---

## Model Classes API Reference

### 1. LoginForm

**Package**: `net.roseindia.form`

Form model for user login functionality.

#### Properties

| Property | Type | Validation | Description |
|----------|------|------------|-------------|
| `userName` | String | `@NotEmpty`, `@Size(min=1, max=50)` | User's login name |
| `password` | String | `@NotEmpty`, `@Size(min=1, max=20)` | User's password |

#### Methods

```java
// Getters
public String getUserName()
public String getPassword()

// Setters
public void setUserName(String userName)
public void setPassword(String password)
```

**Example Usage**:
```java
LoginForm loginForm = new LoginForm();
loginForm.setUserName("john_doe");
loginForm.setPassword("secret123");
```

---

### 2. Registration

**Package**: `net.roseindia.form`

Form model for user registration with comprehensive validation.

#### Properties

| Property | Type | Validation | Description |
|----------|------|------------|-------------|
| `userName` | String | Custom validation | User's chosen username |
| `password` | String | `@NotEmpty`, `@Size(min=4, max=20)` | User's password |
| `confirmPassword` | String | `@NotEmpty`, Must match password | Password confirmation |
| `email` | String | `@NotEmpty`, `@Email` | User's email address |

#### Methods

```java
// Getters
public String getUserName()
public String getPassword()
public String getConfirmPassword()
public String getEmail()

// Setters
public void setUserName(String userName)
public void setPassword(String password)
public void setConfirmPassword(String confirmPassword)
public void setEmail(String email)
```

**Example Usage**:
```java
Registration registration = new Registration();
registration.setUserName("jane_doe");
registration.setPassword("secret123");
registration.setConfirmPassword("secret123");
registration.setEmail("jane@example.com");
```

---

### 3. User

**Package**: `net.roseindia.form`

Simple form model for basic user information.

#### Properties

| Property | Type | Validation | Description |
|----------|------|------------|-------------|
| `userName` | String | None | User's name |
| `email` | String | None | User's email address |

#### Methods

```java
// Getters
public String getUserName()
public String getEmail()

// Setters
public void setUserName(String userName)
public void setEmail(String email)
```

**Example Usage**:
```java
User user = new User();
user.setUserName("test_user");
user.setEmail("test@example.com");
```

---

### 4. ValidationForm

**Package**: `net.roseindia.form`

Form model demonstrating comprehensive Bean Validation features.

#### Properties

| Property | Type | Validation | Description |
|----------|------|------------|-------------|
| `userName` | String | `@NotEmpty`, `@Size(min=1, max=20)` | User's name |
| `age` | Integer | `@NotNull`, `@Min(1)`, `@Max(110)`, `@NumberFormat` | User's age |
| `password` | String | `@NotEmpty`, `@Size(min=1, max=10)`, Custom messages | User's password |

#### Methods

```java
// Getters
public String getUserName()
public Integer getAge()
public String getPassword()

// Setters
public void setUserName(String userName)
public void setAge(Integer age)
public void setPassword(String password)
```

**Example Usage**:
```java
ValidationForm form = new ValidationForm();
form.setUserName("testuser");
form.setAge(25);
form.setPassword("pass123");
```

---

### 5. UploadItem

**Package**: `net.roseindia.form`

Form model for file upload functionality.

#### Properties

| Property | Type | Validation | Description |
|----------|------|------------|-------------|
| `filename` | String | None | Name of the uploaded file |
| `fileData` | CommonsMultipartFile | Size validation (max 10KB) | File data |

#### Methods

```java
// Getters
public String getFilename()
public CommonsMultipartFile getFileData()

// Setters
public void setFilename(String filename)
public void setFileData(CommonsMultipartFile fileData)
```

**Example Usage**:
```java
UploadItem uploadItem = new UploadItem();
uploadItem.setFilename("document.pdf");
uploadItem.setFileData(multipartFile);
```

---

## Validation Components

### RegistrationValidation

**Package**: `net.roseindia.controllers`

Custom validator component for registration form validation.

#### Component Annotation
```java
@Component("registrationValidator")
```

#### Methods

##### `boolean supports(Class<?> klass)`
- **Description**: Checks if the validator supports the given class
- **Parameters**: `klass` - Class to validate
- **Returns**: `true` if Registration class is assignable from the given class

##### `void validate(Object target, Errors errors)`
- **Description**: Performs custom validation logic
- **Parameters**: 
  - `target` - Object to validate (Registration instance)
  - `errors` - Errors object to collect validation errors

#### Validation Rules
1. **Username**: Must not be empty and must not exceed 50 characters
2. **Password Matching**: Password and confirm password must match

**Example Usage**:
```java
@Autowired
private RegistrationValidation registrationValidation;

public String processRegistration(@Valid Registration registration, BindingResult result) {
    registrationValidation.validate(registration, result);
    if (result.hasErrors()) {
        return "registrationform";
    }
    return "registrationsuccess";
}
```

---

## Configuration Reference

### Web Configuration (web.xml)

```xml
<servlet>
    <servlet-name>dispatcher</servlet-name>
    <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
    <load-on-startup>1</load-on-startup>
</servlet>
<servlet-mapping>
    <servlet-name>dispatcher</servlet-name>
    <url-pattern>/forms/*</url-pattern>
</servlet-mapping>
```

### Spring Configuration (dispatcher-servlet.xml)

#### Key Beans

**View Resolver**:
```xml
<bean id="viewResolver" class="org.springframework.web.servlet.view.InternalResourceViewResolver">
    <property name="prefix" value="/WEB-INF/views/" />
    <property name="suffix" value=".jsp" />
</bean>
```

**Message Source**:
```xml
<bean id="messageSource" class="org.springframework.context.support.ReloadableResourceBundleMessageSource">
    <property name="basename" value="/WEB-INF/messages" />
</bean>
```

**Multipart Resolver**:
```xml
<bean id="multipartResolver" class="org.springframework.web.multipart.commons.CommonsMultipartResolver">
</bean>
```

---

## Error Messages Reference

The application uses internationalized error messages defined in `messages.properties`:

| Key | Message |
|-----|---------|
| `NotEmpty.validationForm.userName` | User Name must not be blank. |
| `Size.validationForm.userName` | User Name must between 1 to 20 characters. |
| `NotEmpty.loginForm.userName` | must not be blank. |
| `Size.loginForm.userName` | size must between 1 to 50 characters. |
| `NotEmpty.loginForm.password` | must not be blank. |
| `Size.loginForm.password` | size must between 1 to 20 characters. |
| `NotEmpty.registration.password` | Password must not be blank. |
| `Size.registration.password` | Password must between 4 to 20 characters. |

---

## Usage Examples

### 1. Basic Form Submission

```html
<!-- Simple form example -->
<form action="/forms/formoutput.html" method="post">
    <input type="text" name="userName" placeholder="Enter username" />
    <input type="email" name="email" placeholder="Enter email" />
    <input type="submit" value="Submit" />
</form>
```

### 2. Login Form with Validation

```html
<!-- Login form with Spring form tags -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<form:form method="post" action="loginform.html" modelAttribute="loginForm">
    <form:input path="userName" placeholder="Username" />
    <form:errors path="userName" cssClass="error" />
    
    <form:password path="password" placeholder="Password" />
    <form:errors path="password" cssClass="error" />
    
    <input type="submit" value="Login" />
</form:form>
```

### 3. File Upload Form

```html
<!-- File upload form -->
<form action="/forms/uploadfile" method="post" enctype="multipart/form-data">
    <input type="text" name="filename" placeholder="Enter filename" />
    <input type="file" name="fileData" />
    <input type="submit" value="Upload File" />
</form>
```

### 4. Registration with Validation

```html
<!-- Registration form with comprehensive validation -->
<form:form method="post" action="registrationform.html" modelAttribute="registration">
    <form:input path="userName" placeholder="Username" />
    <form:errors path="userName" cssClass="error" />
    
    <form:password path="password" placeholder="Password" />
    <form:errors path="password" cssClass="error" />
    
    <form:password path="confirmPassword" placeholder="Confirm Password" />
    <form:errors path="confirmPassword" cssClass="error" />
    
    <form:input path="email" type="email" placeholder="Email" />
    <form:errors path="email" cssClass="error" />
    
    <input type="submit" value="Register" />
</form:form>
```

---

## Security Considerations

1. **File Upload Security**: 
   - File size is limited to 10KB
   - Files are stored in a specific directory structure
   - Consider adding file type validation

2. **Authentication**: 
   - Default credentials are hardcoded (for demo purposes)
   - In production, use proper authentication mechanisms

3. **Input Validation**: 
   - All forms use Bean Validation (JSR-303)
   - Custom validation for complex business rules
   - CSRF protection should be added for production

---

## Deployment Instructions

### Prerequisites
- Java 8 or higher
- Apache Tomcat 7.0 or higher
- Maven (optional, for dependency management)

### Required Dependencies
- Spring Framework 3.0+
- Hibernate Validator
- Apache Commons FileUpload
- JSTL
- Servlet API

### Deployment Steps

1. **Build the Project**:
   ```bash
   # Using Eclipse: Right-click project → Export → WAR file
   # Or using Maven:
   mvn clean package
   ```

2. **Deploy to Tomcat**:
   ```bash
   # Copy WAR file to Tomcat webapps directory
   cp Spring3Example.war $TOMCAT_HOME/webapps/
   ```

3. **Start Tomcat**:
   ```bash
   $TOMCAT_HOME/bin/startup.sh
   ```

4. **Access Application**:
   ```
   http://localhost:8080/Spring3Example/
   ```

---

## API Testing

### Using cURL

```bash
# Test Hello World endpoint
curl -X GET http://localhost:8080/Spring3Example/forms/helloworld.html

# Test Login (Form submission)
curl -X POST http://localhost:8080/Spring3Example/forms/loginform.html \
     -d "userName=UserName&password=password" \
     -H "Content-Type: application/x-www-form-urlencoded"

# Test File Upload
curl -X POST http://localhost:8080/Spring3Example/forms/uploadfile \
     -F "filename=test.txt" \
     -F "fileData=@/path/to/test.txt"
```

### Using Postman

1. **Import Collection**: Create requests for each endpoint
2. **Set Headers**: `Content-Type: application/x-www-form-urlencoded` for form submissions
3. **Add Form Data**: Use form-data for file uploads, x-www-form-urlencoded for regular forms

---

## Troubleshooting

### Common Issues

1. **404 Not Found**: 
   - Check URL patterns in web.xml
   - Verify controller mappings
   - Ensure proper servlet mapping

2. **Validation Errors**: 
   - Check JSR-303 annotations
   - Verify message source configuration
   - Ensure proper form binding

3. **File Upload Issues**: 
   - Check multipart resolver configuration
   - Verify file size limits
   - Ensure proper directory permissions

4. **Bean Validation Not Working**: 
   - Add `<mvc:annotation-driven />` to Spring configuration
   - Include Hibernate Validator in classpath
   - Check validation annotations

---

## Contributing

### Code Style Guidelines
- Follow Spring MVC best practices
- Use meaningful variable and method names
- Add comprehensive JavaDoc comments
- Implement proper error handling
- Write unit tests for all public methods

### Adding New Features
1. Create controller in `net.roseindia.controllers` package
2. Add corresponding model classes in `net.roseindia.form` package
3. Create JSP views in `/WEB-INF/views/` directory
4. Update this documentation
5. Add appropriate validation and error handling

---

*This documentation covers all public APIs, functions, and components in the Spring3Example application. For additional support or questions, please refer to the Spring Framework documentation or create an issue in the project repository.*