Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D4A480DF2;
	Wed, 22 Jul 2026 15:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784735282; cv=none; b=jiiYQpi2AhZw8mkKwkA/LUcGQCfS8Y2ppBi2ej4cat4Tb9ZnV30CiawUbSGzK0/e1bfirxN32XHOmSCJq1FKEcOcXvYjUAxEAKhe7U/Eh7KWCb3UMhr5qOw8XTVvTAkRVWpmOL5Y88wMXui7VlcYwYDCKQSFgnbSWK3DhlJXlwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784735282; c=relaxed/simple;
	bh=0a8saeb2riv5wmFya3P5CG3zStVFShSx8moctXGBusU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a5FKUgbBYYZfbGVe0UA0R6lQHDU+vNPDOyiTpKeg8CVIgfYRljksoUYQFOj3ifG7KIcnl0Tx+P5lzSng6u7XwjlZlpLbYboTh/Wh5ZJIx2V7qui0FplGXEl4oEKWJgmH1KovmW/EoCsOz1OUUH27GPkGoo0TDJ4hda3eSUQf19c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RIZJ2W5R; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RIZJ2W5R"
Received: by smtp.kernel.org (Postfix) with ESMTPS id F39A5C2BCC6;
	Wed, 22 Jul 2026 15:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784735282;
	bh=0a8saeb2riv5wmFya3P5CG3zStVFShSx8moctXGBusU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=RIZJ2W5RjduEW3aHM91t3k8Uxku20PEysMdX2SYUbR8UzveThHFF/ya34Ko4U4lpd
	 bbq/AEF4eyFZJE3Twj/4q9Qq2nGtd0DuQmXtXoBK6ctmhTGUtdbQn9hc/S0+hskx50
	 HRjvgSrfMMqPeSuSS7I6or9rCJODT9dVlMCndy1NoQn6IC1sOQjEKazP96kBvtIi9/
	 Hb2O0ILuDKtzWw4Wb26EMZNNeVlSqTJvSNHU7wRT3tizzaNe5SBk6F2kmjFsaM+RgM
	 GSaj8nrN8vW1kc18rv9P8kgxAzKwL0fOShLO0XC9x9GlZllSBGEkTPj+HA3REffDgV
	 SjNIeSrqXaQEg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5639C4453E;
	Wed, 22 Jul 2026 15:48:01 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathan.lynch.amd.com@kernel.org>
Date: Wed, 22 Jul 2026 10:47:47 -0500
Subject: [PATCH 2/4] dmaengine: dmatest: Suppress bogus failures when
 stopping a run
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260722-dmatest-fixes-and-fatal-errors-v1-2-8287709987ea@amd.com>
References: <20260722-dmatest-fixes-and-fatal-errors-v1-0-8287709987ea@amd.com>
In-Reply-To: <20260722-dmatest-fixes-and-fatal-errors-v1-0-8287709987ea@amd.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: Tycho Andersen <tycho@kernel.org>, Wei Huang <wei.huang2@amd.com>, 
 dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nathan Lynch <nathan.lynch@amd.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784735280; l=2864;
 i=nathan.lynch@amd.com; s=20260722; h=from:subject:message-id;
 bh=74Mzvk0OhTQ8oeyoxuGyU/WEbTMbhAo7r3eZp+EdkGI=;
 b=4g8nxKx42X48tlx8QmGzW5nnhlhEjili4Eu6/6VS627E/LbA8IYnyI7XWp6Wd8d2koduhYE93
 C6SWXdM1dfcDP+Rm7nexzpCfha/avFLMxRCSURU2SzP3kdH3QQJHtt1
X-Developer-Key: i=nathan.lynch@amd.com; a=ed25519;
 pk=pO5+BCw/TENGLvwX5NYZOZmZihcxjkxeFSMuk47erps=
X-Endpoint-Received: by B4 Relay for nathan.lynch@amd.com/20260722 with
 auth_id=891
X-Original-From: Nathan Lynch <nathan.lynch@amd.com>
Reply-To: nathan.lynch@amd.com

From: Nathan Lynch <nathan.lynch@amd.com>

Writing 0 to the module 'run' attribute stops the test threads with
kthread_stop(), waking threads out of wait_event_freezable_timeout()
before the last transfer's completion callback has run. The stopping
thread samples the transfer status and then checks done->done at two
different instants, so the last transaction gets misreported two ways:

- "test timed out": the wait returns early with done->done still clear
  even though the transfer is simply still finishing — not a real
  timeout.

- "completion busy status": status is read as DMA_IN_PROGRESS a moment
  before the transfer completes and latches done->done, so the stale
  status is reported as a failure against a transfer that actually
  succeeded.

This is not a recent regression: the threads have used an interruptible,
freezable timeout wait since long before the wait queue was moved into
thread context by commit 6f6a23a213be ("dmaengine: dmatest: move callback
wait queue to thread context"), so a stop has always been able to wake
the wait before the final callback runs.

When kthread_should_stop() returns true, use dma_sync_wait() to settle
the pending transaction. Real errors still yield DMA_ERROR.

Assisted-by: Claude:claude-opus-4-8 [Claude-Code]
Signed-off-by: Nathan Lynch <nathan.lynch@amd.com>
---
 drivers/dma/dmatest.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/dmatest.c b/drivers/dma/dmatest.c
index 60bc448f42ee..3267c7e86f5d 100644
--- a/drivers/dma/dmatest.c
+++ b/drivers/dma/dmatest.c
@@ -702,6 +702,7 @@ static int dmatest_func(void *data)
 		struct dmaengine_unmap_data *um;
 		dma_addr_t *dsts;
 		unsigned int len;
+		bool stopping;
 
 		total_tests++;
 
@@ -839,6 +840,7 @@ static int dmatest_func(void *data)
 			status = dma_sync_wait(chan, cookie);
 			if (status == DMA_COMPLETE)
 				done->done = true;
+			stopping = kthread_should_stop();
 		} else {
 			dma_async_issue_pending(chan);
 
@@ -846,14 +848,19 @@ static int dmatest_func(void *data)
 					done->done,
 					msecs_to_jiffies(params->timeout));
 
-			status = dma_async_is_tx_complete(chan, cookie, NULL,
-							  NULL);
+			stopping = kthread_should_stop();
+			status = stopping ?
+				dma_sync_wait(chan, cookie) :
+				dma_async_is_tx_complete(chan, cookie, NULL, NULL);
 		}
 
 		if (!done->done) {
-			result("test timed out", total_tests, src->off, dst->off,
-			       len, 0);
-			goto error_unmap_continue;
+			/* stopping: dma_sync_wait() let the transfer finish, not a timeout */
+			if (!stopping) {
+				result("test timed out", total_tests, src->off,
+				       dst->off, len, 0);
+				goto error_unmap_continue;
+			}
 		} else if (status != DMA_COMPLETE &&
 			   !(dma_has_cap(DMA_COMPLETION_NO_ORDER,
 					 dev->cap_mask) &&

-- 
2.54.0


