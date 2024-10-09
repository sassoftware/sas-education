# If you're new to Python: Introduction to Python Lists and Dictionaries for Data Science

When working with Python in data science, it's crucial to understand two fundamental data structures: lists and dictionaries. These form the basis for many operations in pandas and are essential for data manipulation and analysis.

## Lists

Lists in Python are ordered, mutable sequences that can contain elements of different types.

### Key features

- Created using square brackets `[]`
- Elements are separated by commas
- Can contain mixed data types
- Indexed starting from 0
- Mutable (can be modified after creation)

### Example

```python
fruits = ['apple', 'banana', 'cherry']
numbers = [1, 2, 3, 4, 5]
mixed = [1, 'hello', 3.14, True]
```

### Common operations

- Accessing elements: `fruits[0]` returns 'apple'
- Slicing: `numbers[1:3]`  # Returns [2, 3]
- Appending: `fruits.append('date')`
- Length: `len(fruits)`

## Dictionaries

Dictionaries are unordered collections of key-value pairs.

### Key features

- Created using curly braces `{}`
- Each item consists of a key and a value, separated by a colon `{'key': 'value'}`
- Keys must be unique and immutable (typically strings or numbers)
- Values can be of any data type
- Mutable (can be modified after creation)

### Example

```python
person = {
    'name': 'Alice',
    'age': 30,
    'city': 'New York'
}
```

### Common operations

- Accessing values: `person['name']` returns 'Alice'
- Adding new key-value pairs: `person['job'] = 'Data Scientist'`
- Getting all keys: `person.keys()`
- Getting all values: `person.values()`

## Relevance to pandas

- pandas Series objects are similar to Python lists but with added functionality. You can think of a Series as a single column of data.
- pandas DataFrames can be thought of as dictionaries of Series (columns)
- Many pandas functions accept lists and dictionaries as arguments

Understanding these basic Python data structures will help you grasp pandas concepts more easily and manipulate data more effectively in your data science projects.
