Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644D243BDDD;
	Thu, 20 Aug 2026 13:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787231702; cv=none; b=tCXKNkm3O1sp0hpjJuywKuWOhyiRsFAWlo8HntQGOLDVFMRQDg0qjH1GYr2oTBlsaAdmzYSUeQqpzwkyQHAXv3WQQsc/B5jfp2jHooNwQS95jT1RTKdzYrF2IlJgjNocKl0d986YBqP6floczA7rc/V6hmPj3GY//NqGq1olaWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787231702; c=relaxed/simple;
	bh=cXfbWFSDBlzsVdc/HZVNlonWtm6RseXRa8IZywYp0kA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M36jpmiYnDTsEqL6VvLohrAFbcRiQ1NWih3IXUHsOrZJml31RunK1FyGcqyHYKQmsZLEtvuk9Lsj0PB1o4ZoQYUzZJ8HOhNht4AwGSt+YVJfT44LoBFzSQCA/mxffG3BHQb2/ynOWF+blrc+qENIp9Mmjg0KKFrjOE1WlR2mJOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G07uRmwD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G07uRmwD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 977E71F00A3D;
	Thu, 20 Aug 2026 13:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787231700;
	bh=VotPPE4R78FW2/dIuysNkgWMrNvKf8WKkwmucU/lVOc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=G07uRmwDcdv1ZCMi21ysmnMdoMMFVypde5CCQKrWE3pLdSTgvXtXBwpPy0cXYIgU/
	 MFVZBgQ1ardoANKsqLllaHVQfLqDothDqe6fDJ21n5U40w2u7FDf9SMArBVGfiRUd8
	 QpZL3nFU/UVCnNjzmuIOAZPiQvtUxrUEwtkKftO/cq8NHHijkXuxrbGMOVGFJC5BVT
	 ewAeHKQg+I82isStJmF5AwJ6RtZNZdcSMy9NHOYLoqN4rM0QzqDM6Ps+DwLAa0Ex5S
	 NUB7gODW+9wbnd754SlSKzl5ErTySbwI4UMtvX6/TwoXQq8jE2NS4KR2XnomkZDROA
	 3PowPF8SwGUrQ==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 20 Aug 2026 15:14:55 +0200
Subject: [PATCH v2 01/13] dmaengine: ste_dma40: Fix failed start cleanup
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-dma40-fixes-v2-1-63238334c707@kernel.org>
References: <20260820-dma40-fixes-v2-0-63238334c707@kernel.org>
In-Reply-To: <20260820-dma40-fixes-v2-0-63238334c707@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, sashiko-bot@kernel.org
X-Mailer: b4 0.14.3

If d40_start() fails after a queued descriptor has been moved to the
active list, d40_queue_start() currently returns NULL without unwinding
the transfer state or clearing the channel busy flag.

Fix this pre-existing error path by completing the descriptor through the
normal tasklet path, clearing the busy flag, balancing the runtime PM
reference and returning an error pointer to distinguish the failure from
the no-work case. Do not free the descriptor directly, since it has
already been submitted and has a DMA cookie.

Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/dmaengine/20260618051539.15E201F000E9@smtp.kernel.org/
Assisted-by: Codex:gpt-5-5
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 0d9ffa3e2663..facc1bcf42a0 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -1531,8 +1531,15 @@ static struct d40_desc *d40_queue_start(struct d40_chan *d40c)
 		/* Start dma job */
 		err = d40_start(d40c);
 
-		if (err)
-			return NULL;
+		if (err) {
+			d40_desc_remove(d40d);
+			d40_desc_done(d40c, d40d);
+			d40c->pending_tx++;
+			d40c->busy = false;
+			pm_runtime_put_autosuspend(d40c->base->dev);
+			tasklet_schedule(&d40c->tasklet);
+			return ERR_PTR(err);
+		}
 	}
 
 	return d40d;

-- 
2.55.0

