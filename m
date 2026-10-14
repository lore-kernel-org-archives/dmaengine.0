Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA23356773;
	Wed, 14 Oct 2026 23:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792022290; cv=none; b=DptVX0rHL0STC+2/9vjUieOu2B37VWfjgPk4+jMW2JmKd7G+sTdhiJm85m9avrw/SHhvACStoJ47LFWWN9r09MLH23c/7uC72LFqRg17ypVFeR+Yz4SMyHViwMA1hJbF3T6oAvg54ofTodrMZbTVLr1tP4XiF3+FELUoyIDzOL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792022290; c=relaxed/simple;
	bh=BBNgSFYtTED4gc4KjQd/tUlL0Uhir2q7Je/nlbYFT2k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:
	 In-Reply-To:References:To:Cc; b=cbKQMBXJ3lno5ymUffS/oTXa7OvyzkF2Q3RGfLTvCf9rc2zzyT/IhqHhX39aaVAknB1xbELf2XR5NoVs3XU28Gr6ZsiC7Bvri8ut9TgW1/9Rpxg0mqc+jkwPp3Hl35dqHfLYsaiaGcU68w39GErFVzrFHhq9Mw4QoKGNGlns0c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iLCEH6cV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iLCEH6cV"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C8759C2BCF5;
	Wed, 14 Oct 2026 23:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792022289;
	bh=BBNgSFYtTED4gc4KjQd/tUlL0Uhir2q7Je/nlbYFT2k=;
	h=From:Date:Subject:In-Reply-To:References:To:Cc:Reply-To:From;
	b=iLCEH6cVI2amFiwJpO0JN7bwRYzMabB8U6JjQZU/hyJE1oV/nY1GKdvF8sYLUiO6t
	 mlBaBVUHD/HNBZEKCZ5anNUqACH5SqUue+ZSLJNRt5O59la+WS7GY4K27pxXaWbRKC
	 JVCr20AGJXgqRYh1xOXzVFOeoMjv9SXsZpYyzQvhaYuwYCoGjHvn2C+lAeeE6VnhwE
	 a4crzgTJcc3Y7aMmzQ29119b9vANPPaho1z7X7OywZzGoTrYEps+ZGF2n65jvslXp6
	 JUn0HmVInYBd05MI/tZFlfqbbYVxmluTUaP292MXTTVtEfRXVgP9yoWWIpcVjylz92
	 y63ZqIwEjpM4A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4A80CC6B2D;
	Wed, 14 Oct 2026 23:58:09 +0000 (UTC)
From: Mizuno Miotsuki via B4 Relay <devnull+founder.crepuse.com@kernel.org>
Date: Thu, 15 Oct 2026 07:58:08 +0800
Subject: [PATCH v3] dmaengine: pl330: Fix unbalanced runtime PM
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-review-pl330-pm-original-v3-v3-1-5be09f37df77@crepuse.com>
X-B4-Tracking: v=1; b=H4sIAA8X0GoC/yWP3Q6CMAxGX8Xs2iJjQtQr38N4sY0KVdjIivhDe
 Hc3SXrzNacn/WbBGAhZnDazCDgRk3cxqO1G2Fa7BoHqmEWRF5XMZQkJwhcMnVI5DD34QA053cG
 kwODhIOviaJW5iWgYAt7o/bdfrmvmp7mjHZMyEUYzggna2Tatom/179a7SLTEow+f/4NTkUxCV
 mW+T1OB2qtSgoSGRmB0NWCvqQN+Njpk31TgHLx9gG1p4Mz6XlyXZfkBPzXHsPYAAAA=
X-Change-ID: 20261015-review-pl330-pm-original-v3-be881d29c3bf
In-Reply-To: <1650450456-34351-1-git-send-email-sugar.zhang@rock-chips.com>
References: <1650450456-34351-1-git-send-email-sugar.zhang@rock-chips.com>
To: vkoul@kernel.org
Cc: dmaengine@vger.kernel.org, krzk@kernel.org, ulfh@kernel.org, 
 Frank.Li@kernel.org, m.szyprowski@samsung.com, huibin.hong@rock-chips.com, 
 rmk+kernel@arm.linux.org.uk, sugar.zhang@rock-chips.com, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5020;
 i=founder@crepuse.com; s=20261012; h=from:subject:message-id;
 bh=dH6QyJ7OcZPyaRLWF7m5BqNce6CGMbzXSoeguCrRg3g=;
 b=owGbwMvMwCUmds2G2fVJ/hLG02pJDFkXxPmvT4r5vMi9vVlylcXDiP86v95xsz35YsA5b5ZnS
 PqM9eEtHRNZGMS4GCzFFFlmi7KXH2pecW3uhCY7mDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHQMeYgYtTAKZaiIWR4YTRbR87czMbOY1eqZalaiKJK+t2CExKrVP2f7Aoun9WA8M/tSeTXty
 9z3RSXDVf/OE+Hc7giVV3a+JOHBHXm3hl/fxbHAA=
X-Developer-Key: i=founder@crepuse.com; a=openpgp;
 fpr=9B150777C283A8D69D90823E16D63C0345E46FA4
X-Endpoint-Received: by B4 Relay for founder@crepuse.com/20261012 with
 auth_id=1166
X-Original-From: Mizuno Miotsuki <founder@crepuse.com>
Reply-To: founder@crepuse.com

From: Sugar Zhang <sugar.zhang@rock-chips.com>

This driver use runtime PM autosuspend mechanism to manager clk.

  pm_runtime_use_autosuspend(&adev->dev);
  pm_runtime_set_autosuspend_delay(&adev->dev, PL330_AUTOSUSPEND_DELAY);

So, after ref count reached to zero, it will enter suspend
after the delay time elapsed.

The unbalanced PM:

* May cause dmac the next start failed.
* May cause dmac read unexpected state.
* May cause dmac stall if power down happen at the middle of the transfer.
  e.g. may lose ack from AXI bus and stall.

Considering the following situation:

      DMA TERMINATE               TASKLET ROUTINE
            |                            |
            |                       issue_pending
            |                            |
            |                     pch->active = true
            |                       pm_runtime_get
  pm_runtime_put(if active)              |
    pch->active = false                  |
            |                      work_list empty
            |                            |
            |                     pm_runtime_put(unconditional)
            |                            |

At this point, it's unbalanced(1 get / 2 put).

After this patch:

      DMA TERMINATE               TASKLET ROUTINE
            |                            |
            |                       issue_pending
            |                            |
            |                     pch->active = true
            |                       pm_runtime_get
  pm_runtime_put(if active)              |
    pch->active = false                  |
            |                      work_list empty
            |                            |
            |                   pm_runtime_put(if active)
            |                            |

Now, it's balanced(1 get / 1 put).

Fixes: 5c9e6c2b2ba3 ("dmaengine: pl330: Fix runtime PM support for terminated transfers")
Fixes: ae43b3289186 ("ARM: 8202/1: dmaengine: pl330: Add runtime Power Management support v12")

Link: https://lore.kernel.org/r/1650450456-34351-1-git-send-email-sugar.zhang@rock-chips.com
Signed-off-by: Huibin Hong <huibin.hong@rock-chips.com>
Signed-off-by: Sugar Zhang <sugar.zhang@rock-chips.com>
Signed-off-by: Mizuno Miotsuki <founder@crepuse.com>
---
Hi Vinod, Sugar and Huibin,

I am forwarding Sugar's April 2022 v2 as v3, with the same one-line
change, original authorship and original Signed-off-by chain. The
original submission is linked in the commit message. I found no mainline
merge or revert of this change; current dmaengine fixes, next and master
still use the unconditional assignment.

Our SaneBSP investigation on an RK3308B UNIHIKER M10 independently
rediscovered the same accounting issue. The experimental G-only kernel
logged:

  dma-pl330 ff2c0000.dma-controller: Runtime PM usage count underflow!

The subsequent H kernel, which included this gate, did not report the
warning during a four-rate 62.625 MiB qualification and a bounded serdev
regression. H also contains other changes, and G/H were experimental
kernels. This is additional runtime evidence, not an isolated hardware
proof of this one-line fix on upstream. None of the experimental cyclic
DMA modifications is included here.

A source-anchored reference-count model reproduces the extra put after
termination in the old path and balances the active-gated path, including
cyclic requeue. That is a model, not a compiled-kernel race reproducer.

Validation of this rebased patch:
- ARM64 W=1 drivers/dma/pl330.o build on dmaengine/fixes.
- Strict checkpatch, including the two historical Fixes IDs.
- Clean application on current dmaengine fixes/next/master and mainline.

Would you reconsider the outstanding patch? Please let us know if there
was an objection or an alternative fix outside the archived discussion.

Changes in v3:
- Rebase the unchanged code change onto dmaengine/fixes, Linux 7.3-rc4.
- Add an archival Link to the original v2.
- Preserve the original author, commit explanation, Fixes and DCO trailers.
- Add the bounded new evidence and validation here, outside the commit.

Changes in v2 (Sugar, 2022):
- Update the commit message following Vinod's suggestions.

Regards,
Mizuno Miotsuki
---
 drivers/dma/pl330.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
index 6214d9000..17264a05d 100644
--- a/drivers/dma/pl330.c
+++ b/drivers/dma/pl330.c
@@ -2090,7 +2090,7 @@ static void pl330_tasklet(struct tasklet_struct *t)
 		spin_lock(&pch->thread->dmac->lock);
 		_stop(pch->thread);
 		spin_unlock(&pch->thread->dmac->lock);
-		power_down = true;
+		power_down = pch->active;
 		pch->active = false;
 	} else {
 		/* Make sure the PL330 Channel thread is active */

---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20261015-review-pl330-pm-original-v3-be881d29c3bf

Best regards,
--  
Mizuno Miotsuki <founder@crepuse.com>


