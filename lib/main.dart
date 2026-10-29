import 'package:flutter/material.dart';

void main() {
  runApp(const WorkflowApp());
}

class WorkflowApp extends StatelessWidget {
  const WorkflowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PFEBSIT 002 Workflow Automation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const WorkflowHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class WorkflowHomePage extends StatefulWidget {
  const WorkflowHomePage({super.key});

  @override
  State<WorkflowHomePage> createState() => _WorkflowHomePageState();
}

class _WorkflowHomePageState extends State<WorkflowHomePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _requestController = TextEditingController();

  bool _isLoading = false;
  String? _statusMessage;
  bool _isError = false;

  void _submitWorkflow() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
        _statusMessage = "Connecting to automation pipeline & validating inputs...";
        _isError = false;
      });

      await Future.delayed(const Duration(seconds: 2));

      setState(() {
        _isLoading = false;
        _statusMessage = "Success: Request queued, validation passed, and notification dispatched!";
        _isError = false;
      });
    }
  }

  void _simulateAdverseTest() async {
    setState(() {
      _isLoading = true;
      _statusMessage = "Simulating transient network failure & exponential backoff retry...";
      _isError = false;
    });

    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _isLoading = false;
      _statusMessage = "Adverse Test Caught: Transient error encountered. Retry limit reached; routed to Dead-Letter Queue for manual review.";
      _isError = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Integrative Programming 2 - Week 13 Automation'),
        backgroundColor: Colors.blue.shade800,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'University Service Request Automation',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Submit workflow items and evaluate retry/recovery automation states.',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      
                      TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          labelText: 'Requester Name',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the requester name.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),

                      TextFormField(
                        controller: _requestController,
                        maxLines: 3,
                        decoration: const InputDecoration(
                          labelText: 'Service Request Details',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.description),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please provide service request details.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24),

                      ElevatedButton.icon(
                        onPressed: _isLoading ? null : _submitWorkflow,
                        icon: const Icon(Icons.send),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue.shade700,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        label: const Text('Submit Workflow Request', style: TextStyle(fontSize: 16)),
                      ),
                      const SizedBox(height: 12),

                      OutlinedButton.icon(
                        onPressed: _isLoading ? null : _simulateAdverseTest,
                        icon: const Icon(Icons.warning_amber, color: Colors.orange),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        label: const Text('Simulate Adverse / Failure Case'),
                      ),
                      const SizedBox(height: 24),

                      if (_isLoading)
                        const Center(child: CircularProgressIndicator())
                      else if (_statusMessage != null)
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: _isError ? Colors.red.shade50 : Colors.green.shade50,
                            border: Border.all(color: _isError ? Colors.red : Colors.green),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            _statusMessage!,
                            style: TextStyle(
                              color: _isError ? Colors.red.shade800 : Colors.green.shade800,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}