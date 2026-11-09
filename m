Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794200563;
	b=34D0Q3fz3yuFsJWy84lgFMOznoMLLD+mUdwiy/cNR8051/qhFU7Xu48RnungvaDw5KtX
	 hLv+ISJZvFkkYfeoWpq94CMJhTwFnVZVgtTJnaB4rmsE9ARgSdqNunMo9N+mqxK2HYQ+P
	 cEd7cAWY36w79aTbLtXgPcetks/pgyalxGyRcUiMjJYFeIDyf4oXBOtmm1qFN002iocyK
	 KzJKqZcUqsfxQyTEihXF38FY+w6HxlpX2jHy000rCMKzyl6aA4C742PPJkDMXujwpi3RO
	 D8QEN7zAZca86FbTsUwEeJTa2O5I/8l/FavLntsiVmKyYUOtp7XP5ax9fA86RIW0huA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794200563;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=YeFAvqaFBjTDbwHpdVBu+3G5WzX84h/1VRkYo0vld38=;
	b=B8Hr3LO+F0SVh0hBa3owk2kZ1SmI2VBtkqnJxM2qxPJdSXxM49D9XB3lM4a+qbBGf3PH
	 LNookWuuEa+qeMp1raDHWMSAEanQyhTmUkSo0PFvXLZVaVBrUv29wybDUDjJPvYUemsd6
	 mb89ClW1ZhdhJ3HS1TmcOdU+CKzi9+JGXzf9i3hiThE0hINDKC/+BsXbiaR2Bo2OPSPM6
	 WnY0aUKlSXOcljMGS/oAP/3PwUdZa5YIarcotRPgWDjD85vLCbYDC/gtvnrBYumwoGGkR
	 zk9aq6cplQLoLdKkkkKnW/qnZrO0yPuRyuDYsdH6kyXrmxEnVxIj+HJdgt1G1B7g4HA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WNu9PZcY;
	arc=none smtp.remote-ip=209.85.167.176
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E009E606D801
	for <dmaengine@vger.kernel.org>; Mon,  9 Nov 2026 05:02:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E009E606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WNu9PZcY
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-4d198f1a591so220560b6e.2
        for <dmaengine@vger.kernel.org>; Sun, 08 Nov 2026 21:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794200562; x=1794805362; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YeFAvqaFBjTDbwHpdVBu+3G5WzX84h/1VRkYo0vld38=;
        b=WNu9PZcY7TxOXyoWPWzBuRH9pbkVd+P/ZOLuHkQI15l10MtCNqSJuQsITVb21JP30q
         dGXavCQ/ecYJIncDXhoVZ1yv1S7pPEdBKbwDVcl7+UbYve8jTxz6XTHQb3koywSZ5OHF
         xmeiO6o1VM9Baqh3BS0bLTm463i0lro22JEeFh7lol9tewxyIimf/24HToDd6p5KuXa3
         LRRjjV+uYEQOe7dAXIBwqS5k5IrRh3ppk7h/W6gZh9lr0zSXMd/yibyOBSUJ0oCPSHqD
         V2E4VLdsL7+P6pirEGsIWjvcmvxqEZY48v8gD8LAFlpHax4FFQ1IHm5efcbL+uiatUEC
         Aqdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794200562; x=1794805362;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YeFAvqaFBjTDbwHpdVBu+3G5WzX84h/1VRkYo0vld38=;
        b=XI0dtAanDW1z4KDADhZFek98CaJXbspche+d+ZTZwO0mFNioFyYgImwoaLJKf4pY8u
         zPHHlAMBlF9ojyXDWORBNInVFLFajXTqPN728m5U5XeIDem3fQpNgwS797HKJY5ekysW
         HWaRCgg2eYj/nn7f5/fMOfRhsgDnqKAyfDIXQSWflUA4EJj80IfwYRm1jjdpFZhfQMRp
         7O9NWFU+2yZ8paxWN9nBCEsIVzKgwKwhfL4SoYs8JQ0Wk86Gt4S87KJMmcEz45gYQvv5
         PRwGD9OZXMCOK1/p2dPF9ApRjeVY4bhvtuToi9SiTH+MQWZkpQaRmzaeJdgrdahLuemi
         CDpw==
X-Gm-Message-State: APuU4Z/p1yw1uOWqKbdFxXXe8+O8siCZdqQ0egcKwZPF346pSLEbiIeH
	SV2StupjwA5nGeE37y+B2jEaFTJnQiZ5VyuE4IC/ioWzpNZzprNzD7mDNrYCKAW3
X-Gm-Gg: AYBFou2EQ37769qeWIxfpkCKGJuhP1oJzslktvKYt4Q+hbJw+ANSEppGYOJBspUbwbB
	Tj1nrsFwhpZjd0eYPaSGdh/mspUzhG+nVDvQGhBrYNmEIhG+/D0cGd2q6m4HddE9rIK/O/6HZeb
	TiH1bl/7nCPUSkySAZ7YXe/i8L6JMPo/xCtz+Qcoqndh8ScNyshyl5Sts0QvhK/fandP08BA4YO
	/hHsEDbxuuVDokTWg52e3wq0G9dE7NZph4FUyPfetTKe15yreTts2jQGLLQ4YTIqXKSY1AOTrfq
	r3hsXuv3FGDPLB5FiLIZzpb+A6q1cS9d4wHU5LapkWeWItvNV91nXgQRcrUTAekBEnY6OySNWy8
	zCB9YkaOqyOXts9Dqk5WmplWD28golN3xzGS0DXlh4kgH3D0VPxqKlNFu3G6i/qLmAtKyK+zVEX
	bwKcu6utwa4wvGEIYLWvA682t6PSIKuANhU30PB56TBgtZ3MCfZ409c1QBmax4W3RQfo9MeyP7A
	dgROLv7bdg0C5hQkBtR6CsCGifCvLiBBXJek1VIlJFh2Cl6DXhW9Y1CFw/9H2dyVO0nNrfOaMqg
	URTlh+dSITrLjO+zBmCo/Dq7i8TSMlpnA0NXTMpJgJG2lhsjp2LnSq46F8KcWR9NTc0W0d2Z+V4
	s+Q9F/T9IvkiEh78tLLtYh7cadbZ+Q83S1kbQ1IxXkuk6oTfiv/MyyLLXKWLIpE3U8Y/lY5AFDW
	p1S+zQsT101+gTzd87IcV7v73PuiPdOlpJceSH2pSJUk4dr5wGzF09TGPSNvQg2utXeSQRW8N5w
	g==
X-Received: by 2002:a05:6808:13cc:b0:567:aa7b:4836 with SMTP id 5614622812f47-568144b6c0emr1886261b6e.26.1794200561873;
        Sun, 08 Nov 2026 21:02:41 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56813ac6352sm3570841b6e.1.2026.11.08.21.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 21:02:41 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 22:02:37 -0700
Subject: [PATCH 2/3] dmaengine: dw-axi-dmac: retain descriptors when
 termination times out
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-submit-dw-axi-dma-stop-pause-v1-v1-2-c48ec19e9ee4@gmail.com>
References: <20261108-submit-dw-axi-dma-stop-pause-v1-v1-0-c48ec19e9ee4@gmail.com>
In-Reply-To: <20261108-submit-dw-axi-dma-stop-pause-v1-v1-0-c48ec19e9ee4@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sergey Khimich <serghox@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2

dma_chan_terminate_all() warns when the channel enable bit does not clear,
but then frees the descriptors and returns success. Its synchronize
callback only drains virtual-channel callbacks, so terminate_sync() can
also report success while hardware still accesses the transfer.

Return the polling error before detaching descriptors or changing the
peripheral routing. This keeps the transfer resources available while
the channel remains enabled and lets the caller retry termination without
treating the timeout as a successful stop.

Hold the channel lock across disabling, polling and descriptor detachment
so an interrupt handler cannot restart the channel between the stop check
and cleanup.

Fixes: 1deb96c0fa58 ("dmaegine: dw-axi-dmac: Support device_prep_dma_cyclic()")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index 49f65486e862..de092f190528 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -1186,21 +1186,24 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
 	int ret;
 	LIST_HEAD(head);
 
+	spin_lock_irqsave(&chan->vc.lock, flags);
+
 	axi_chan_disable(chan);
 
 	ret = read_poll_timeout_atomic(axi_chan_is_hw_enable, enabled, !enabled,
 				      1000, 50000, false, chan);
-	if (ret == -ETIMEDOUT)
+	if (ret) {
+		spin_unlock_irqrestore(&chan->vc.lock, flags);
 		dev_warn(dmaengine_chan_dev(dchan),
 			 "%s failed to stop\n", axi_chan_name(chan));
+		return ret;
+	}
 
 	if (chan->direction != DMA_MEM_TO_MEM)
 		dw_axi_dma_set_hw_channel(chan, false);
 	if (chan->direction == DMA_MEM_TO_DEV)
 		dw_axi_dma_set_byte_halfword(chan, false);
 
-	spin_lock_irqsave(&chan->vc.lock, flags);
-
 	vchan_get_all_descriptors(&chan->vc, &head);
 
 	chan->cyclic = false;

-- 
2.53.0

