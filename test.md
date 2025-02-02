# Tree-sitter Markdown Test

## 1. Headings & Lists

### Ordered List

1. First item
2. Second item
3. Third item

### Unordered List

- Bullet one
- Bullet two
- **Bold item**
- _Italic item_

---

## 2. Code Blocks

alpha
$\alpha \beta \Beta$

### Inline Code

$This is an auto-triggered test snippet in LaTeX mode!$
Use `printf("Hello, World!")` in C.

$$
### Fenced Code Block

```python
# Python example
def square(x):
    return x * x

print(square(5))
```


---

## 3. Math Blocks

### Inline Math

Euler's formula: $e^{i\pi} + 1 = 0$

### Block Math
$This is an auto-triggered test snippet in LaTeX mode!$


$$

\sum\_{i=1}^{n} i = \frac{n(n+1)}{2}

$$

---

## 4. Links, Quotes, and Tables

### Link

[Neovim Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

### Blockquote

> "The only way to learn mathematics is to do mathematics." - Paul Halmos

### Table

| Name  | Age | Language |
| ----- | --: | -------- |
| Alice |  25 | Python   |
| Bob   |  30 | R        |
| Eve   |  27 | MATLAB   |

---

## 5. Checklist

- [x] Set up Treesitter
- [ ] Enable more parsers
- [ ] Learn incremental selection

---

## 6. Nested Elements

- **Bold list**
  - _Italic sublist_
    - `Inline code in list`
      - $$ a^2 + b^2 = c^2 $$
$$
