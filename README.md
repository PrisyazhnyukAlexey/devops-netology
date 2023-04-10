
# netology study devops
# 1 Вопрос
git show aefea
# 2 Вопрос
 v0.12.23
# 3 Вопрос
git cat-file -p b8d720\
parent 56cd7859e05c36c06b56d013b55a252d0bb7e158\
parent 9ea88f22fc6269854151c571162c5bcf958bee2b\

# 4 вопрос
git log --pretty=format:"%h %s" v0.12.23..v0.12.24\
или\
git log --pretty=format:"%h %ad | %aN | %s" --date=short v0.12.23..v0.12.24\


