#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>

int main() {
    pid_t pid;
    int i;

    // Create multiple child processes
    for (i = 0; i < 3; i++) {
        pid = fork();

        if (pid == 0) {
            // Child process
            printf("Child process created with PID: %d\n", getpid());
            exit(0);
        }
    }

    // Parent process cleans up child processes
    pid_t child_pid;
    while ((child_pid = wait(NULL)) > 0) {
        printf("Parent cleaned up child process with PID: %d\n", child_pid);
    }

    return 0;
}
