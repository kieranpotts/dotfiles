---
name: Refactor
about: Redesign parts of the system to make it easier to maintain and extend
title: ''
labels: refactoring
assignees: ''
---

Suggest how the structure and design of the source code and configuration can be changed in such as way that it will make the system easier to maintain and develop further.

This category of work is focused on the needs of the developers and maintainers of the software system, rather than its owners or users. The proposed changes should not impact the external behavior or interfaces of the program. While refactoring work may not directly improve attributes such as performance and scalability, good architecture and clean code is the foundation on which high quality systems are built.

Technical debt is a popular metaphor for explaining the value of refactoring.

Consider the short-term costs and potential risks versus the longer-term benefits to be gained by implementing the proposed changes.

Is there any data that can be auto-generated to measure the impact of these changes, such as extensions to test coverage, reductions in the number of lines of code, or improvements to code complexity metrics such as Cyclomatic Complexity and NPath?
