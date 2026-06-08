import 'package:flutter/material.dart';

void main() {
  runApp(const GroupFlutterAndroidApp());
}

class GroupFlutterAndroidApp extends StatelessWidget {
  const GroupFlutterAndroidApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '小组 Android 真机运行展示',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const TeamAndroidHomePage(),
    );
  }
}

class TeamAndroidHomePage extends StatelessWidget {
  const TeamAndroidHomePage({super.key});

  static const String projectTitle = 'GitHub协作下的Flutter真机实践';
  static const String projectSlogan = '7人协作，一次跑通Android真机';
  static const String deviceProof = '最终证据：用第二部手机拍摄手持 Android 真机运行照片，并加入 GitHub README。';

  static const String experimentTopic = 'GitHub 协作与 Flutter Android 真机运行案例';
  static const String experimentGoal = '证明 7 人小组确实完成了 GitHub 多人协作，并且最终的 Flutter 成果确实成功运行到了真实的 Android 手机上。';
  static const String teamScale = '7 人小组（包含 1 名组长和 6 名组员）';
  static const String techStack = 'Flutter SDK、Dart 语言、GitHub 版本控制平台、Android SDK 组件以及 ADB (Android Debug Bridge) 真机调试工具';
  static const String experimentFlow = '涵盖本地开发环境预检配置、GitHub 多分支拉取与 PR 提交/合并、手机开启 USB 联调授权，以及最终通过命令行将应用部署到真实设备。';
  static const String deliverables = '包含 7 人完整 Fork、分支、Commit 以及 Pull Request 协作记录的 GitHub 最终主仓库；内嵌合格真机照片证据（必须由第二部手机拍摄的手持真机运行画面）的 README 文档。';

  static const List<TeamMember> members = [
    TeamMember(role: '组长', name: '李组长', task: '创建仓库、维护 main、审核 PR、组织主电脑和主手机完成真机运行'),
    TeamMember(role: '组员 A', name: '成员 A', task: '修改应用标题 projectTitle 和项目口号 projectSlogan'),
    TeamMember(role: '组员 B', name: '成员 B', task: '补充 members 中的小组成员姓名与分工'),
    TeamMember(role: '组员 C', name: '成员 C', task: '补充 androidTasks 中的真机运行检查任务'),
    TeamMember(role: '组员 D', name: '成员 D', task: '补充 evidenceNotes 中的拍照和 README 证据说明'),
    TeamMember(role: '组员 E', name: '成员 E', task: '测试设备、实验信息'),
    TeamMember(role: '组员 F', name: '成员 F', task: '服装 README 文档完善'),
  ];

  static const List<String> androidTasks = [
    '1. 选择一台主运行电脑和一台 Android 手机作为测试设备',
    '2. 在主电脑上配置 Flutter SDK 和 Android SDK 开发环境',
    '3. 手机开启「开发者选项」和「USB调试」功能',
    '4. 用数据线连接手机到电脑，并在手机上授权电脑调试',
    '5. 终端执行 adb devices，确认设备状态为 device',
    '6. 终端执行 flutter devices，确认识别到连接的手机',
    '7. 运行 flutter run，将应用安装并启动到真机',
    '8. 在手机上验证应用界面和功能正常运行',
  ];

  static const List<String> evidenceNotes = [
    '不能提交 Web 截图或模拟器截图。',
    '不能使用手机直接截图代替照片。',
    '必须用第二部手机拍摄，并拍到手持真机。',
    '照片需发到小组，并加入 GitHub README。',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Android 真机运行展示')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          HeroSection(),
          SizedBox(height: 20),
          ExperimentInfoSection(),
          SizedBox(height: 20),
          TestDevicesSection(),
          SizedBox(height: 20),
          MembersSection(),
          SizedBox(height: 20),
          AndroidTasksSection(),
          SizedBox(height: 20),
          EvidenceSection(),
        ],
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.teal.shade50,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Icon(Icons.phone_android, size: 42, color: Colors.teal),
            SizedBox(height: 12),
            Text(
              TeamAndroidHomePage.projectTitle,
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(TeamAndroidHomePage.projectSlogan, style: TextStyle(fontSize: 16)),
            SizedBox(height: 12),
            Text(TeamAndroidHomePage.deviceProof, style: TextStyle(fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}

class MembersSection extends StatelessWidget {
  const MembersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('小组成员与分工', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        ...TeamAndroidHomePage.members.map((member) => MemberCard(member: member)),
      ],
    );
  }
}

class MemberCard extends StatelessWidget {
  const MemberCard({required this.member, super.key});

  final TeamMember member;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(child: Text(member.role.characters.last)),
        title: Text('${member.role}：${member.name}'),
        subtitle: Text(member.task),
      ),
    );
  }
}

class AndroidTasksSection extends StatelessWidget {
  const AndroidTasksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Android 真机运行任务', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ...TeamAndroidHomePage.androidTasks.map((task) => Text('• $task')),
          ],
        ),
      ),
    );
  }
}

class EvidenceSection extends StatelessWidget {
  const EvidenceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.orange.shade50,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('真机照片证据要求', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ...TeamAndroidHomePage.evidenceNotes.map((note) => Text('• $note')),
          ],
        ),
      ),
    );
  }
}

class ExperimentInfoSection extends StatelessWidget {
  const ExperimentInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue.shade50,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              '实验概述',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            SizedBox(height: 16),
            InfoItem(
              icon: Icons.bookmark,
              label: '实验主题',
              value: TeamAndroidHomePage.experimentTopic,
            ),
            SizedBox(height: 12),
            InfoItem(
              icon: Icons.check_circle,
              label: '核心目标',
              value: TeamAndroidHomePage.experimentGoal,
            ),
            SizedBox(height: 12),
            InfoItem(
              icon: Icons.group,
              label: '协作规模',
              value: TeamAndroidHomePage.teamScale,
            ),
            SizedBox(height: 12),
            InfoItem(
              icon: Icons.code,
              label: '核心技术栈与工具链',
              value: TeamAndroidHomePage.techStack,
            ),
            SizedBox(height: 12),
            InfoItem(
              icon: Icons.route,
              label: '实验核心流程',
              value: TeamAndroidHomePage.experimentFlow,
            ),
            SizedBox(height: 12),
            InfoItem(
              icon: Icons.description,
              label: '预期交付物',
              value: TeamAndroidHomePage.deliverables,
            ),
          ],
        ),
      ),
    );
  }
}

class InfoItem extends StatelessWidget {
  const InfoItem({
    required this.icon,
    required this.label,
    required this.value,
    super.key,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.blue, size: 20),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 4),
              Text(value),
            ],
          ),
        ),
      ],
    );
  }
}

class TestDevicesSection extends StatelessWidget {
  const TestDevicesSection({super.key});

  static const List<DeviceInfo> devices = [
    DeviceInfo(
      name: '测试手机',
      icon: Icons.smartphone,
      type: '手机',
      specs: [
        '手机型号：OPPO K12x 5G',
        '操作系统：ColorOS 15.0',
        '处理器：高通骁龙 695 5G 八核',
        '运行内存：12.0 GB + 12.0 GB（支持虚拟内存扩展）',
        '存储空间：256 GB',
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '测试设备',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        ...devices.map((device) => DeviceCard(device: device)),
      ],
    );
  }
}

class DeviceCard extends StatelessWidget {
  const DeviceCard({required this.device, super.key});

  final DeviceInfo device;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(device.icon, size: 32, color: Colors.teal),
            const SizedBox(height: 8),
            Text(
              device.name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(device.type, style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 8),
            ...device.specs.map((spec) => Text(
                  spec,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                )),
          ],
        ),
      ),
    );
  }
}

class DeviceInfo {
  const DeviceInfo({
    required this.name,
    required this.icon,
    required this.type,
    required this.specs,
  });

  final String name;
  final IconData icon;
  final String type;
  final List<String> specs;
}

class TeamMember {
  const TeamMember({required this.role, required this.name, required this.task});

  final String role;
  final String name;
  final String task;
}
