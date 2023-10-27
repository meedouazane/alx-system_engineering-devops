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
 * main - zombie function
 *
 * Return: Always 0.
 */
int main(void)
{
	int i = 0;
	pid_t zombie;

	for (i = 0; i <= 4; i++)
	{
		zombie = fork();
		if (zombie > 0)
		{
			printf("Zombie process created, PID: %d\n", zombie);
			sleep(2);
		}
		else
			exit(0);
	}
}
