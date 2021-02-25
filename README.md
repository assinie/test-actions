![build status](https://github.com/assinie/test-actions/workflows/build/badge.svg?branch=main&event=push)
# test-actions

## Usage
- Download the repository [archive](https://github.com/assinie/test-actions/archive/main.zip) and unzip it.

- Go to the newly created directory: `cd test-actions-main`

- Replace `hello` with your project name in the following files
  - **Makefile**: on line `export PROJECT := hello`
  - **docs/Makefile**: on line `PROJECT ?= hello`
  - **src/Makefile**: on line `PROJECT ?= hello`

- Rename **docs/hello.md** to *your_project.md*

- Remove **src/hello.s** and put your source files in **src**

```
├── cc65
├── md2hlp
├── orix-software
├── orix-sdk
└── my_project
    ├── Makefile
    ├── README.md
    ├── docs
    │   ├── Makefile
    │   ├── hello.md
    │   └── md2hlp.cfg
    └── src
        ├── Makefile
        └── hello.s
```

```
repository
├── Makefile
├── README.md
├── docs
│   ├── Makefile
│   ├── hello.md
│   └── md2hlp.cfg
└── src
    ├── Makefile
    └── hello.s
```

```
repository
└── build
    ├── bin
    │   └── hello
    ├── obj
    │   └── hello.o
    └── usr
        └── share
            └── man
                └── hello.hlp
```

```
artifact
├── bin
│   └── hello
└── usr
    └── share
        └── man
            └── hello.hlp
```

