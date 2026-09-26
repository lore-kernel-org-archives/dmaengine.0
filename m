Received: from mail-pj2-f0.google.com (mail-pj2-f0.google.com [74.125.227.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A22284B37
	for <dmaengine@vger.kernel.org>; Sat, 26 Sep 2026 17:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790442659; cv=none; b=Kj0xxCfJT1YGHj3DhH+EQ7L/IWhuPH0RmOHnqDfr7tWzn/c2x4Xh380Xzk/bsueSh8yyl5gUu8Xkwu5MZUUbhifc7jUHFcEBIdVfe1AdIub3vfgCu20T2FqBAKVax0h95IBpXGUVWd0NGRpb2z8LpgAEcRFv73JUk+dd2XrSWFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790442659; c=relaxed/simple;
	bh=1Ijmd4NtwbrxYG0QbmrAlqjExMAyCe44/2dJ1XZKKMU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jQx9RAMejhMiaDcXfsQ9FZPdgmT7cD1FmYu0yc0EkrehCegeUvumu6dBjDhvu349b8ZB9aj0VCVmqVOFvG5yHOA9NnRZvBmZ/8DFbqxTNvNrP6BbXVp6331TMnrVyHvDPK1Gb5XgqxQ0506uNDi0dr9oN61aEUHDI5kaInKu7G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=embeddedlinux.blog; spf=pass smtp.mailfrom=embeddedlinux.blog; dkim=pass (2048-bit key) header.d=embeddedlinux.blog header.i=@embeddedlinux.blog header.b=L2IgYw6v; arc=none smtp.client-ip=74.125.227.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=embeddedlinux.blog
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedlinux.blog
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=embeddedlinux.blog header.i=@embeddedlinux.blog header.b="L2IgYw6v"
Received: by mail-pj2-f0.google.com with SMTP id 98e67ed59e1d1-39e0e245eadso689033a91.0
        for <dmaengine@vger.kernel.org>; Sat, 26 Sep 2026 10:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=embeddedlinux.blog; s=google; t=1790442657; x=1791047457; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F0/79LdVzvZe+TAFF8pS9QgkNB/YVyvKTl0/c5RoqxI=;
        b=L2IgYw6vW8xHZseT0u/BrE3tqC4C62lAdDxT4lMSuILCnmhBEqEt27ypHi8rQK06Bk
         HrGUp/4oC/m+yslwIFGAZ61FvvFcG4x/j8nNqswfdNntkD+SZeOuYbfqdTFwhQFhcwBS
         eyiC/tiqTH6ZbdhgovRXypAlRDXHc9gLJ1DHu1Y0z/DWo+KnWzqWTgyhSw5Jc4oacw10
         7OxnMUgyln/RK4UAJm6q4826RGyhM5HNpptyeiXBq7LYWYZKA9du4wbwFGxVGlZLf0ww
         yWnkOlDAEmuWOkauwgJRnuERCrKY4S5zwoOrJjANH/ur9puem4Ap8MbxfFYMQQA3Veg7
         /s2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790442657; x=1791047457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F0/79LdVzvZe+TAFF8pS9QgkNB/YVyvKTl0/c5RoqxI=;
        b=pzIawzaJN/slh7cK+lVgBmajZWGwDb1YEsA3kYFCyMss8baDxMiK9fb7oVOH8diTa+
         mt1HCcj7VhnQI7w3HUrtKkIbdvVLVFX0xCBQc/Qa/KxKrq6ZsMMZw0zfkesA4Fa7Yb0O
         McFwHdK9msrZ57PZ6Nbi50Xp3KDSYmcy4seszDBA/UD4/UAnypfs1R0QfoEtWFw9egJp
         iPccIyQLxYa/HRzXjTsAoQj4/XjzZKAUhWLKP78OYF6pxKqxLBkrvYW5EhaHkvJkJGA6
         02KR1NYY32kmJ/42VdjGmU9ZqV7B/ATwCBZLeT/w7CONks9vYbSr5hLCXRr7EBePm040
         ZvBQ==
X-Forwarded-Encrypted: i=1; AKwUvBz6sqqzALVKvIO5jmcTySZ54ck70K4fB5tds+N2x8LyYB0viNxeWRLpaK/+LiDzsQ3JpuKAm/jagnM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJN/vMNZkrI1W6OHWmjP7Er2AXVc0NUDSBh24BHRK3T1+lpKjij
	yhcD78plF1204fDQ8wwrZzQ7sFSk3gsuGSHrXXhcd8IstuipU0UTItdcC/cbut5pQzsW
X-Gm-Gg: AYBFou3yVVwNXEFGI1GFmUv5G/q1/y+LEcwO0hDbxYDoNRMKcRRgxCjvj01dj/JqciP
	XDLlHhPY6R5ZRw9jL3saYTwftazx9PF7EVZNeghUAcpxrx9MT+fGbyMTIm8JO38AdLBs+da3Fge
	NNcZuJpwnr8t5dzVvfQon+28YXDVBi/Qkz2vT4ZE7jeeuj/EXpvO/9PjoBIHgJzSQeEq8iFKIkY
	S0zNqqp1Jy1gPXxupgjSz0nntMh2KcE20A0UhiUFl8wLdHKQ0vAcR+oqbbSZ4C1om5nOQK01sOv
	1PDuF16d273s0+1/i0KYLDQ779fzhFPgCbx7DC/HTdn6qeFQ1apMoiTUMqQ3BOfzuwJ8yZEYrdw
	H2cH3yBqFoG/ATze8QPVc0kHvj+4QdwidB/AgV4oIErZ46FrZK6l9qJj3GH0c79U+zEuni5I9kr
	DxeomR9O/qkYnPIl7DF9R0vijegMM5bf/YkUmdgRm6r3bqR0lzKwnEYk2NfVKKQ+61cQ==
X-Received: by 2002:a17:90b:4c42:b0:39e:4c80:f680 with SMTP id 98e67ed59e1d1-3a098bb66d1mr8321977a91.31.1790442656808;
        Sat, 26 Sep 2026 10:10:56 -0700 (PDT)
Received: from ltu.. ([171.245.4.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976c7435sm17467136a91.11.2026.09.26.10.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 10:10:55 -0700 (PDT)
From: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Chengfeng Ye <dg573847474@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	tien.nguyenminh@embeddedlinux.blog,
	stable@vger.kernel.org
Subject: [PATCH v3] dmaengine: sun6i: Fix potential deadlock on &sdev->lock
Date: Sun, 27 Sep 2026 00:10:49 +0700
Message-Id: <20260926171049.841335-1-tien.nguyenminh@embeddedlinux.blog>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chengfeng Ye <dg573847474@gmail.com>

As &sdev->lock is taken by the tasklet sun6i_dma_tasklet() in softirq
context, other users of the lock in process context should disable
interrupts, otherwise the tasklet can preempt a holder of the lock on
the same CPU and deadlock. sun6i_dma_terminate_all() and
sun6i_dma_pause() take it without disabling interrupts.

This was found by an experimental static analysis tool for irq-related
deadlocks. Lockdep reports it too on an Allwinner T113, where the lock
is also taken inside the HARDIRQ-safe vc->lock:

  [  299.389380] WARNING: possible irq lock inversion dependency detected
  [  299.411196] c7109568 (&sdc->lock){+.-.}-{3:3}, at: sun6i_dma_terminate_all+0x40/0x2c4
  [  299.419137] but this lock was taken by another, HARDIRQ-safe lock in the past:
  [  299.426398]  (&vc->lock){-.-.}-{3:3}

Use spin_lock_irqsave() in both places, as
sun6i_dma_free_chan_resources() already does.

Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
Cc: stable@vger.kernel.org
Signed-off-by: Chengfeng Ye <dg573847474@gmail.com>
[tien: rebased, added the lockdep report from a T113, Fixes and Cc stable]
Signed-off-by: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
---
I ran into this on a MangoPi MQ-Dual (Allwinner T113-S3): with lockdep
on, stopping dmatest set off the report above in
sun6i_dma_terminate_all(), and a small test module set it off in
sun6i_dma_pause(). While looking for a fix I found Chengfeng's v2 from
2023. It never got a review and no longer applies, so I rebased it on
dmaengine next and added the lockdep report, a Fixes tag and Cc stable.
Chengfeng, I hope you don't mind me picking it up.

With it, lockdep stays quiet on both paths on 7.3-rc4, and dmatest on
four channels passes while another channel is paused, resumed and
terminated in a loop.

v2: https://lore.kernel.org/20230726051727.64088-1-dg573847474@gmail.com

 drivers/dma/sun6i-dma.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 5ad9d01cf..aee32363c 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -887,6 +887,7 @@ static int sun6i_dma_pause(struct dma_chan *chan)
 	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
 	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
 	struct sun6i_pchan *pchan = vchan->phy;
+	unsigned long flags;
 
 	dev_dbg(dmaengine_chan_dev(chan), "vchan %p: pause\n", &vchan->vc);
 
@@ -894,9 +895,9 @@ static int sun6i_dma_pause(struct dma_chan *chan)
 		writel(DMA_CHAN_PAUSE_PAUSE,
 		       pchan->base + DMA_CHAN_PAUSE);
 	} else {
-		spin_lock(&sdev->lock);
+		spin_lock_irqsave(&sdev->lock, flags);
 		list_del_init(&vchan->node);
-		spin_unlock(&sdev->lock);
+		spin_unlock_irqrestore(&sdev->lock, flags);
 	}
 
 	return 0;
@@ -935,9 +936,9 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 	unsigned long flags;
 	LIST_HEAD(head);
 
-	spin_lock(&sdev->lock);
+	spin_lock_irqsave(&sdev->lock, flags);
 	list_del_init(&vchan->node);
-	spin_unlock(&sdev->lock);
+	spin_unlock_irqrestore(&sdev->lock, flags);
 
 	spin_lock_irqsave(&vchan->vc.lock, flags);
 

base-commit: 0a8dda0a15d3926422d286567f945a05328a4ac6
-- 
2.34.1

