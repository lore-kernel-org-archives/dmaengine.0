Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494C14746A9;
	Wed, 22 Jul 2026 15:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784735282; cv=none; b=lO3kGPMWSwkbq0lJhwBp8pFZ+EWiXWR1DqROku3dEqk2gJt+GyG0HN/aeAxT0NxD7j8/Y35PHzAXmDhumGtVj2BTi8FnDShOe3Y9JluBWXNs55m6HN9o07Jo4kCDTi/xWbV+QgtbFYZTS0FdCSdWNAjw9O8g8GSLScLuL/qkc/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784735282; c=relaxed/simple;
	bh=w5Qar+QoG5RH8yAeQ9Y9wPVTkp9H94z3ypFFhg5ET1M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tbpJLf0ypyuHQE9lZPTObKd3iR7JfvYt1tTQegmeaw2Al/U0bSfYGfbNLHCevvadaivmyN0nli++M2kEVCtohyrd9THjU9cQzdrYf/LrnXimOjwHcmfYmiX42SCvqQAyzBP59IhkDwfwJccjR9erkZGeB7y9+3mv/lUDdFj3wN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CtJHG7gq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CtJHG7gq"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E2498C2BCB3;
	Wed, 22 Jul 2026 15:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784735282;
	bh=w5Qar+QoG5RH8yAeQ9Y9wPVTkp9H94z3ypFFhg5ET1M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=CtJHG7gqy57hlFSnVFPalxNd3jtfl5JI4sUtbMCVkoB/yYw+oUyUFPfPCg/1JukuH
	 Od5AlBTqkG7ifI5zlR+cwEJ/5B3X7aBi2pppWmp3WXD2/QkF1sMj86asPqYNomalEY
	 m2SqgjVGYdnz4nlVpdrmxGLFSdgr8mAp6mG1gQonEsRCdq3pXRjyVPUZYy3FkWiaF5
	 pUwOXJREkR4DuT6AKD/Dqh+4E7o6zcHqwgG3dlb1T0coz5lj0N24aAyGkkQUxVVLMf
	 mh4QHvEJ1PCfCy8Vbw7uGDsCuulvmiTpdC3e/omXSEPUBgmplJWsTpDDm4/rjH/ejk
	 t9MWB5RIZvPwA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C31F5C44539;
	Wed, 22 Jul 2026 15:48:01 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathan.lynch.amd.com@kernel.org>
Date: Wed, 22 Jul 2026 10:47:46 -0500
Subject: [PATCH 1/4] dmaengine: dmatest: Don't forcibly terminate channel
 in polled mode
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-dmatest-fixes-and-fatal-errors-v1-1-8287709987ea@amd.com>
References: <20260722-dmatest-fixes-and-fatal-errors-v1-0-8287709987ea@amd.com>
In-Reply-To: <20260722-dmatest-fixes-and-fatal-errors-v1-0-8287709987ea@amd.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: Tycho Andersen <tycho@kernel.org>, Wei Huang <wei.huang2@amd.com>, 
 dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nathan Lynch <nathan.lynch@amd.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784735280; l=1508;
 i=nathan.lynch@amd.com; s=20260722; h=from:subject:message-id;
 bh=bgtcSNqMScacYr65kuIB7nzRdUTetKq2Oy8oDO2rtQI=;
 b=Uk5WS/4WEiqYz81XjlyzumJ4PJwdv1BZQ3iYnda/sghVKSOMhLxhyxMqDYaFT7bWwxRC5D8s2
 aZVnIkcjovMB6d4nu9+R4IpJ7W1SQFmf/akwyDI3EYRJIgNVu5X1rNk
X-Developer-Key: i=nathan.lynch@amd.com; a=ed25519;
 pk=pO5+BCw/TENGLvwX5NYZOZmZihcxjkxeFSMuk47erps=
X-Endpoint-Received: by B4 Relay for nathan.lynch@amd.com/20260722 with
 auth_id=891
X-Original-From: Nathan Lynch <nathan.lynch@amd.com>
Reply-To: nathan.lynch@amd.com

From: Nathan Lynch <nathan.lynch@amd.com>

Invoking dmaengine_terminate_sync() against the channel after each
submitted descriptor is strange. It's benign when the test is
single-threaded, but disruptive when multiple threads are submitting
descriptors to the channel concurrently:

  # cd /sys/module/dmatest/parameters/
  # echo 1 > polled
  # echo 2 > threads_per_chan
  # echo dma0chan0 > channel
  # echo 1 > run
...
  dmatest: Added 2 threads using dma0chan0
  dmatest: Started 2 threads using dma0chan0
  xilinx-zynqmp-dma ffa80000.dma: dma_sync_wait: timeout!
  xilinx-zynqmp-dma ffa80000.dma: dma_sync_wait: timeout!
  dmatest: dma0chan0-copy0: result #3: 'test timed out' with
    src_off=0x487 dst_off=0xf8 len=0x171b (0)
  dmatest: dma0chan0-copy1: result #6: 'test timed out' with
    src_off=0x227d dst_off=0xf99 len=0xf7a (0)

Remove the call to dmaengine_terminate_sync() from the main thread
loop.

Fixes: fb9816f9d05f ("dmaengine: dmatest: Add support for completion polling")
Signed-off-by: Nathan Lynch <nathan.lynch@amd.com>
---
 drivers/dma/dmatest.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/dma/dmatest.c b/drivers/dma/dmatest.c
index 2ae3469397f3..60bc448f42ee 100644
--- a/drivers/dma/dmatest.c
+++ b/drivers/dma/dmatest.c
@@ -837,7 +837,6 @@ static int dmatest_func(void *data)
 
 		if (params->polled) {
 			status = dma_sync_wait(chan, cookie);
-			dmaengine_terminate_sync(chan);
 			if (status == DMA_COMPLETE)
 				done->done = true;
 		} else {

-- 
2.54.0


