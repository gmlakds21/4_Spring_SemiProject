import java.util.Scanner;

public class prac {

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);
        System.out.print("구매하시려는 로또 게임수를 입력해 주세요 : ");
        int times = sc.nextInt();
        int[][] numbers;

        // 로또 번호 추출
        numbers = makeNumber(times);

        // 로또 번호 정렬
        numbers = arrayNumber(numbers);

        // 로또 번호 출력
        printNumber(numbers);

        }


    static int[][] makeNumber(int times) {

        int[][] numbers = new int[times][5];

        for(int i = 0; i < times; i++ ) {

            int j=0;
            while (j < 5) {

                // 새 번호 받기, 검증
                int newNumber = (int)(Math.random()*45)+1;
                for (int check = 0; check < 5; check++) {
                    if (numbers[i][check] == newNumber) {
                        continue;
                    }
                }

                // 새 번호 삽입
                numbers[i][j] = newNumber;
                j++;
            }
        }
        return numbers;
    }

    static int[][] arrayNumber(int[][] numbers) {

        for (int t=0; t<numbers.length; t++) {
            for (int i=0; i<5; i++) {
                for (int j=i+1; j<5; j++) {
                    if( numbers[t][i] > numbers[t][j] ) {
                        int switching = numbers[t][i];
                        numbers[t][i] = numbers[t][j];
                        numbers[t][j] = switching;
                    }
                }
            }
        }
        return numbers;
    }

    static void printNumber(int[][] numbers) {

        System.out.println("배움님의 로또 번호를 생성하겠습니다.");
        for(int i=0; i<numbers.length; i++) {
            System.out.print((i+1)+"게임 : ");
            for(int j=0; j<5; j++) {
                System.out.printf(" %2d", numbers[i][j]);
            }
            System.out.println("");
        }
    }
}
