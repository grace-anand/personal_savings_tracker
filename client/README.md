## Setup

#### Install node.js
Install node.js version 18.12.1 or if you have nvm installed, run the below command.

```bash
nvm use
```

#### Install pnpm
pnpm is the package manager used for this project. Install it globally using the below command.

```bash
npm install -g pnpm
```

#### Install the dependencies using pnpm:

```bash
pnpm install --shamefully-hoist
```

#### Copy .env.example to .env:

```bash
cp .env.example .env
```

## Development Server

Start the development server on http://localhost:3000

```bash
pnpm run dev
```

## Production

To build the application for production:

```bash
pnpm run build
```

Locally preview production build:

```bash
pnpm run preview
```
