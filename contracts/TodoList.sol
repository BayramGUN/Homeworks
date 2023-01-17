// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

contract TodoList {
    // Todo item struct
    struct Todo {
        string title;
        string content;
        bool isComplated;
    }

    // Todo item struct array. 
    Todo[] public todos;

    // Create todo item
    function create(string calldata _title, string calldata _content) external {
        todos.push(Todo({
            title: _title,
            content: _content,
            isComplated: false
        }));
    }

    // update title of specific todo item with its index on Todo array
    function updateTitle(uint256 _index, string calldata _title) external {
        todos[_index].title = _title;
    }

    // update content of specific todo item with its index on Todo array
    function updateContent(uint256 _index, string calldata _content) external {
        todos[_index].content = _content;
    }

    // get todo item with its index on Todo array
    function get(uint256 _index) external view returns(string memory, string memory, bool) {
        Todo storage todo = todos[_index];

        return (todo.title, todo.content, todo.isComplated);
    }

    // mark toggle as compalated or not for a todo item
    function toggleComplated(uint256 _index) external {
        todos[_index].isComplated = !todos[_index].isComplated;
    }
}