Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E01480DF8;
	Wed, 22 Jul 2026 15:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784735282; cv=none; b=VxVkOEFzTOqNuohXBRQzHqu55kS40MEO75wV2EHsIvUofkAC9VVw5+fmSBbHUvZlMxbvbSuqtGpVb8Pq+NH42hny4vidfyn8jczEQO9VVGFiOhdL2TpaGMex9JQoxbqui/rcCkvRvKz9oxP6bUDLw4jPCSObc1ytLSJVJlqrpkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784735282; c=relaxed/simple;
	bh=efzaA7sedl1M6FoQei3qVECApE90OMYOiVlKOiXCMEA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FOcZm09nMc2PKK5QyNK4WiYa/RPciqdnZpnkFzg6DCkeRAGy7X4qXmh3KHfZpg+M23tIFsb9aE+aGMtNTz5wiLWfcJIBTJ70Il3Uvc1cmGXLAWf8xqO/0MUKhsPuORZTvCjdl+YfI7K59bZd4ydvGH6VklwZ/PawK/q9THhou7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V0q8fQxd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V0q8fQxd"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0D28EC2BCFB;
	Wed, 22 Jul 2026 15:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784735282;
	bh=efzaA7sedl1M6FoQei3qVECApE90OMYOiVlKOiXCMEA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=V0q8fQxdy7m6QFAAviX4P61KCUCh3astd1iZwsIcmR3zwL2AApY9ONmY0oiljVzru
	 t7lq1ody1LWic8uZEfa9MiOGBWapzLvaXsO5WZHF9fkX+jbEXYAM1hz0cBVV4T7oLL
	 C3BE3wnbiC9q6jPhLPk84vn8LpC/ZnzAmNXgPTaolqUpLbQkQELb9Bl9dw794Rzor/
	 j9TsHoHlwyYj0fZ+noE7TQYOUlHh4lu9BRLoAFzOFunFJMCVr/KBA9MFVYw6AB3LDf
	 InURFoAbwCcyGjV9U3pvBwLNN3bePr7k3obB+iaR/utSCodboZjG6zfi/s577zhkZx
	 Kd+vdcySPVOJg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB0E1C4453C;
	Wed, 22 Jul 2026 15:48:01 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathan.lynch.amd.com@kernel.org>
Date: Wed, 22 Jul 2026 10:47:48 -0500
Subject: [PATCH 3/4] dmaengine: dmatest: Terminate channel before freeing
 threads
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-dmatest-fixes-and-fatal-errors-v1-3-8287709987ea@amd.com>
References: <20260722-dmatest-fixes-and-fatal-errors-v1-0-8287709987ea@amd.com>
In-Reply-To: <20260722-dmatest-fixes-and-fatal-errors-v1-0-8287709987ea@amd.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: Tycho Andersen <tycho@kernel.org>, Wei Huang <wei.huang2@amd.com>, 
 dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nathan Lynch <nathan.lynch@amd.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784735280; l=1679;
 i=nathan.lynch@amd.com; s=20260722; h=from:subject:message-id;
 bh=/0q1Z1d1+2oGXvP2+BrsGqvG+5+zUlAtwDMzMF2C+Mk=;
 b=SOqPziyDMTrFeN9HfcYkh2T22cJ2YzcJccaRSZ37T2mP4Avx/UTiYyZLTAnE1Z9zXcUil87Gn
 G0T4wtcdJ9cBXiwf9qUbWWcvewEaFtHhSk5o1kgJZg8+SbY7IHAEjpR
X-Developer-Key: i=nathan.lynch@amd.com; a=ed25519;
 pk=pO5+BCw/TENGLvwX5NYZOZmZihcxjkxeFSMuk47erps=
X-Endpoint-Received: by B4 Relay for nathan.lynch@amd.com/20260722 with
 auth_id=891
X-Original-From: Nathan Lynch <nathan.lynch@amd.com>
Reply-To: nathan.lynch@amd.com

From: Nathan Lynch <nathan.lynch@amd.com>

On a channel shared by multiple threads, the completion callbacks run from
one tasklet, and dmaengine_terminate_sync() flushes it. Freeing a thread
before that flush can leave a pending callback pointing at freed memory
(dmatest_callback() reads thread->done).

Stop all channel threads and then flush the channel before freeing the
threads.

Fixes: 6f6a23a213be ("dmaengine: dmatest: move callback wait queue to thread context")
Assisted-by: Claude:claude-opus-4-8 [Claude-Code]
Signed-off-by: Nathan Lynch <nathan.lynch@amd.com>
---
 drivers/dma/dmatest.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/dmatest.c b/drivers/dma/dmatest.c
index 3267c7e86f5d..0d7752c2451a 100644
--- a/drivers/dma/dmatest.c
+++ b/drivers/dma/dmatest.c
@@ -959,18 +959,23 @@ static void dmatest_cleanup_channel(struct dmatest_chan *dtc)
 	struct dmatest_thread	*_thread;
 	int			ret;
 
-	list_for_each_entry_safe(thread, _thread, &dtc->threads, node) {
+	/* stop all threads first */
+	list_for_each_entry(thread, &dtc->threads, node) {
 		ret = kthread_stop(thread->task);
 		pr_debug("thread %s exited with status %d\n",
 			 thread->task->comm, ret);
+	}
+
+	/* flush the channel (e.g. vchan_synchronize() -> tasklet_kill()) */
+	dmaengine_terminate_sync(dtc->chan);
+
+	/* now it is safe to free the thread memory */
+	list_for_each_entry_safe(thread, _thread, &dtc->threads, node) {
 		list_del(&thread->node);
 		put_task_struct(thread->task);
 		kfree(thread);
 	}
 
-	/* terminate all transfers on specified channels */
-	dmaengine_terminate_sync(dtc->chan);
-
 	kfree(dtc);
 }
 

-- 
2.54.0


