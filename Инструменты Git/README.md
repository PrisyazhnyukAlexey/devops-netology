

## 1 Вопрос (Найдите полный хеш и комментарий коммита, хеш которого начинается на aefea)
    git show aefea 
## 2 Вопрос (Какому тегу соответствует коммит 85024d3)
    v0.12.23
## 3 Вопрос (Сколько родителей у коммита b8d720? Напишите их хеши.)
    git cat-file -p b8d720\
    parent 56cd7859e05c36c06b56d013b55a252d0bb7e158\
    parent 9ea88f22fc6269854151c571162c5bcf958bee2b\

## 4 вопрос (Перечислите хеши и комментарии всех коммитов, которые были сделаны между тегами v0.12.23 и v0.12.24.)
    git log --pretty=format:"%h %s" v0.12.23..v0.12.24\
или\
    git log --pretty=format:"%h %ad | %aN | %s" --date=short v0.12.23..v0.12.24\

> 33ff1c03bb v0.12.24\
> b14b74c493 [Website] vmc provider links\
> 3f235065b9 Update CHANGELOG.md\
> 6ae64e247b registry: Fix panic when server is unreachable\
> 5c619ca1ba website: Remove links to the getting started guide's old location\
> 06275647e2 Update CHANGELOG.md\
> d5f9411f51 command: Fix bug when using terraform login on Windows\
> 4b6d06cc5d Update CHANGELOG.md\
> dd01a35078 Update CHANGELOG.md\
> 225466bc3e Cleanup after v0.12.23 release\

## 5 Вопрос(Найдите коммит, в котором была создана функция func providerSource, её определение в коде выглядит так: func providerSource(...) (вместо троеточия перечислены аргументы).)
    git grep -p "func providerSource("
## 6 Вопрос (Найдите все коммиты, в которых была изменена функция globalPluginDirs)
    git grep -p "globalPluginDirs(" - ищем файл с функцией\
    git log -L :globalPluginDirs:plugins.go - ищем историю по файлу\
## 7 Вопрос (Кто автор функции synchronizedWriters)
    git log -S "func synchronizedWriters(" --pretty=format:"%h %an %ad %s" \
