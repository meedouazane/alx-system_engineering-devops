#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/types.h>
/**
 * infinite_while - infinite loop
 * Return: 0
 */
int infinite_while(void)
{
	while (1)
	{
		sleep(1);
	}
	return (0);
}
/**
 * zombie - create zombie
 * Return: 0
 */
int zombie(void)
{
	pid_t z = fork();

	if (z > 0)
	{
		printf("Zombie process created, PID: %d\n", z);
		sleep(10);
	}
	else
		exit(0);
}
/**
 * main - zombie function
 *
 * Return: Always 0.
 */
int main(void)
{
	int i = 0;

	for (i = 0; i <= 4; i++)
		zombie();
	infinite_while();
	return (EXIT_SUCCESS);
}
