---
name: Refactoring
about: Record design debt or suggest how the internal structure of the program might be improved
title: ''
labels: REFACTORING
assignees: ''
---

Use this issue to suggest how the internal structure and design of the source code and configuration can be changed in such as way that it will make the system easier to maintain and develop further.

This category of work is focused on the needs of the developers and maintainers of the software system, rather than its owners or users. The proposed changes should not impact the external operations and interfaces, or the internal behaviors, of the program. While refactoring work may not directly improve external non-functional attributes such as performance and scalability, good architecture and clean code is the foundation on which high quality systems are built.

Technical debt (aka design debt) is a popular metaphor for explaining the value of refactoring to organizations that pay the development bills.

Consider the short-term costs and potential risks versus the longer-term benefits to be gained by implementing the proposed changes. Is there any data that can be generated to measure the impact of these changes, such as extensions to test coverage, reductions in the number of lines of code, or improvements to code complexity metrics such as Cyclomatic Complexity or NPath?
