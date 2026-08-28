# HP Bar 데이터팩

마인크래프트에서 몹의 체력바를 표시하는 데이터팩입니다.

## 기능

- 몹의 현재 체력과 최대 체력을 실시간으로 표시
- 체력에 따라 전경 체력바가 자동으로 조절됨
- 흡수량이 있을 때 노란색 흡수 체력바 표시
- 현재 체력과 흡수량을 텍스트로 표시
- 체력이 0이 되거나 대상과 분리되면 체력바 자동 제거

## 사용 방법

1. 데이터팩을 월드의 `datapacks` 폴더에 넣습니다.
2. 월드에서 `/reload`를 실행합니다.
3. 체력바를 표시할 몹에게 `hp_bar_owner` 태그를 추가합니다.

```mcfunction
/tag <대상> add hp_bar_owner
```

예시:

```mcfunction
/tag @e[type=zombie,limit=1,sort=nearest] add hp_bar_owner
```

태그가 추가된 몹을 기준으로 체력바가 생성되며, 이후 체력 변화가 자동으로 반영됩니다.

## 내부 데이터

아래 항목은 데이터팩이 체력바를 계산하고 갱신하는 데 사용하는 내부 데이터입니다. 충돌을 피하려면 다른 명령어나 데이터팩에서 삭제하거나 값을 직접 변경하지 마세요.

### Scoreboard

`hp_bar_`로 시작하는 다음 objective는 모두 내부용입니다.

- `hp_bar_old_max_hp`, `hp_bar_abs`, `hp_bar_old_max_abs`, `hp_bar_max_abs`
- `hp_bar_hp_ratio`, `hp_bar_Constant`, `hp_bar_temp`, `hp_bar_old_abs`
- `hp_bar_max_hp`, `hp_bar_hp`, `hp_bar_kill`, `hp_bar_old_hp`

`#10000`, `#20`, `#13000`은 비율 계산용 상수이며, `#abs`, `#max_abs`, `#hp`, `#max`, `#max_hp`, `#total_hp`, `#temp_s`, `#temp_t`, `#sum_abs`는 계산 중간값을 저장하는 가상 플레이어입니다.

### Storage

`hp_bar:data` 스토리지는 매크로 함수에 값을 전달하기 위한 내부용입니다. 다음 키를 직접 변경하지 마세요.

- `Scale`, `TransX`: 현재 체력바의 크기와 위치
- `AbsScale`, `AbsTransX`: 흡수 체력바의 크기와 위치
- `TextTotalHP`, `TextMaxHP`, `TextAbs`: 체력 텍스트 값

### Tag

- `hp_bar_owner`: 체력바를 표시할 대상에 추가하는 유일한 사용자용 태그입니다.
- `hp_bar`, `hp_bar_back`, `hp_bar_front`, `hp_bar_abs`, `hp_bar_text`, `hp_bar_ride`, `hp_bar_test`: 체력바 엔티티와 내부 상태 관리에 사용하는 태그입니다. 직접 추가하거나 제거하지 마세요.

## 요구 사항

- Minecraft Java Edition 26.2(이상도 되긴 될 듯?)
