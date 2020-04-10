a.out: main.c lib1/target/release/liblib1.a lib2/target/release/liblib2.a
	gcc main.c -Llib1/target/release/ -Llib2/target/release/ -llib1 -llib2 -lpthread -ldl

lib1/target/release/liblib1.a:
	(cd lib1 && cargo build --release)

lib2/target/release/liblib2.a:
	(cd lib2 && cargo build --release)

