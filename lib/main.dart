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

  static const List<TeamMember> members = [
    TeamMember(role: '组长', name: '胡玮明', task: '创建原始仓库，审核 PR，组织最终真机运⾏和提交'),
    TeamMember(role: '组员 A', name: '张春瑾', task: '修改应⽤标题和项⽬⼝号'),
    TeamMember(role: '组员 B', name: '宋阳', task: '修改成员信息和分⼯'),
    TeamMember(role: '组员 C', name: '张景涛', task: '修改真机运⾏任务列表'),
    TeamMember(role: '组员 D', name: '李天宇', task: '修改证据说明和 README 照⽚说明'),、
    TeamMember(role: '组员 E', name: '徐冲', task: '测试设备与实验信息'),、
    TeamMember(role: '组员 F', name: '杨航', task: '负责 README 的项目文档完善（运行说明、成员表格、环境要求）'),、
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

class TeamMember {
  const TeamMember({required this.role, required this.name, required this.task});

  final String role;
  final String name;
  final String task;
}
