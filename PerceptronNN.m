clear all; 
clc; 
close all;

load LearningData.mat
x=[iris(:,2),iris(:,3)];
yd=[iris(:,1)];

M=length(iris);
N=2;

b=0; % Bias
alfa=0.005; % Learning Rate
THRESHOLD = 0;

W=zeros(1,N); % Synaptic Weights
e=zeros(M,1); % Error
y=zeros(M,1); 
s=zeros(M,1);
erro=0;
n = 1;
ITERATIONS = 4;

while( n < ITERATIONS)

    for i = 1 : M            
        
        %Calculate y(n)
        for j = 1:N
            s(i) = s(i) + W(1,j)*x(i,j);
    
            W(1,j) = W(1,j) + (alfa*erro*x(i,j));
        end
    
        if(s(i)>THRESHOLD)
            y(i)=1;
        else
            y(i)=-1;
        end
    
        %Error e(n)
        e(i)=(yd(i)-y(i));
        erro=e(i);
    
        x1 = linspace(4,7);
        y1 = x1/s(i);
    end

    n = n + 1;
end

figure(1);
plot(x(1:50,1),x(1:50,2),'+b',x(51:100,1),x(51:100,2),'*r')
hold on
xlabel('Sepal Length')
ylabel('Petal Length')
plot(x1,y1,'g')
legend('Setosa','Versicolor','NN-Perceptron')
hold off


