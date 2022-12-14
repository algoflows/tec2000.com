// apps/site/pages/topics.tsx
import { TopicButton } from '@tec2000/shared/ui';

/* eslint-disable-next-line */
export interface TopicsProps {}

export function Topics(props: TopicsProps) {
  return (
    <div className="md:container md:mx-auto p-20 bg-gray-100">
      <TopicButton topicName="Nextjs" />
    </div>
  );
}

export default Topics;
