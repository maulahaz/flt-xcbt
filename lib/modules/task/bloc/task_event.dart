abstract class TaskEvent{}

class InitTaskEvent extends TaskEvent{}
class CreateTaskEvent extends TaskEvent{}
class DestroyTaskEvent extends TaskEvent{}