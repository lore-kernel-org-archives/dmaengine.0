Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733613;
	b=048BTCjz5jH2F1iUBBAp+m0mRX13YheA22qmHqoqeb6hrl0wW4iCQY1CjlJpJRhS0VTZ
	 uqxdj6WnZbxwt5iqL2onUWuGLSoriUmTmOJvNU5OwkmpmdDhtiBLTjp0yPXDUcNalJx5P
	 Lr4+PZ0Scc7Px2BAe1ymN8l/L6H6jJEJlw1fvUZwl0qJ+smhYVIqbo0iipIstD/ZUov9Y
	 dAMeyTDVs6zJWGYdDk7Mw0cXM2JjT6bYnrH4eERFpt8zHeNAWwxeSE7m/Em61spJpAPjb
	 NGQxX+X4JvPVLjzaJEzJmBg51cpPG49URnzCwxXgmTRSZJK6cZkCB0bRWCE9k7jGoEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733613;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=WVskqBN7adAe0blUmUVhbRXdugopDwsXLNQtgww94JA=;
	b=4QOYo9bRnnKEESwKPlE+wjjUyDef0VlEyPEJqUVJTqp0PTRKmA1ZAQlUJKT/YhVbFjBg
	 fwqkKeqUU6jiFP3n+kZ84mbFbgpVWWxEpIFvaEqL53Z99NYHKyFNuH3DsdvwBPT1K0WPI
	 mopQldYYINJUB5FYzkhI5IcnUPKco5b3W2jQxrDkHY6H+x2tGNqgJz+Bo5wfO+ZG5m7FX
	 BDVrNC5joz/+5tExA3NKbcPSAISrF5suJHZneOh0IyEmAY21M4nfUCkeL6OQI0yCryDSE
	 VJBo9MiOdKZWOMVRtTWAUiSx+IeHdtFOFSP0CUpmfSqqJkkF+IHJbKrnhfi8jgiLzgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bxwEZ3l+;
	arc=none smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9974606A333
	for <dmaengine@vger.kernel.org>; Sun, 15 Nov 2026 09:06:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9974606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bxwEZ3l+
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6b8e2d8df4fso2339561eaf.1
        for <dmaengine@vger.kernel.org>; Sun, 15 Nov 2026 01:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733611; x=1795338411; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WVskqBN7adAe0blUmUVhbRXdugopDwsXLNQtgww94JA=;
        b=bxwEZ3l+gF3hhrgfZPruRh9xtsNxw4gVNyQRdUeu5/jVXQVHoqWq5IMFVu9aYO1yrE
         SpmZBUHiRDlzitE3jlCpVpHHfx3Wc8q/zEnZJTJ0+cHQfe/l7DQ9Gox49Oy2r6zgXnBD
         QeAunfrnrw+iAdv6tI+9zLLOjvY+D94U7wNJk0Cj8eqSy2lKcLjUW7WfTjQobOljNVgY
         LOW9fl8ZWiYFNK9ZHRLkrP3fRLDQj51HRyFvQg1o6BJe6MkFMP/fGE2VY1x5tcUYhiWH
         8hZZMs3xd/qvOmZ1PrHw7Kz8dVVISQmBUFenYEIQuQ7UIkbYmliJ+JvEFIxmNAYT6QaM
         60+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733611; x=1795338411;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WVskqBN7adAe0blUmUVhbRXdugopDwsXLNQtgww94JA=;
        b=g2eg9o9KL2G4msDPgBbuRHR+TmInppc2BS58ON0UsLh/Z5GjMaT2T709uM7g5LV2XE
         OK4nMJ7WYfFztqHe/yKpG+Y7z79ajes6tGI1WMrVwmMo7IAhZz3RE03aQzVsfovUc52V
         DGzahL9eF4F65Ray0yLkWF/hLUnaX9wSzw7cac2e1tDXjcvtgFTczkczdf+YaWip2GrI
         bfp/9pBXv2CTofrbHsGtCMobdyvVR+s2MVjq4JqxSf4uYCokAfvTLm7ywHS1ciwdVJqF
         egDCtYhlE2uW9Db3X5vP4/IU77lGOzIxtPCkzNTZ6P0SlAe9myBYZfnhzDdanrElsUT0
         KoJA==
X-Gm-Message-State: APuU4Z8+HPNvkiHmfnRhdbVw4r4ZxuvQjTOu+kMn5UqKBIy9bgvslI7O
	t6T6GB8Q/dRKRAVPMOfcTwWnDweDZ0qY1yK1K+xzwoRg8gkkO0WxAwGT
X-Gm-Gg: AYBFou1Kz9oLr4s8HUO4e1z2A5DvAVfUMn3rodtTY/VP0W0xHs/UjZk3N3MeQNS7dHo
	fxBwWNYcx/CDeL9/3xJuC76E3dyAzZQ1OEnqI4SHJ6xbDm34qYsuUFMPkkoNIp+Pn5Q0mYIZPUm
	EFrKNtwNAGIJRYGteF8qOe5p4Rjz6E/4DcO/MQuy5HI8xQKOCSDGk7geIuZmTU24Enovwp/6gJ/
	UZBwlQIWQg3BO8NwHRWiqSTlJq4RSEVPd6rhlLOAqXvqRanIO/zyZwcqNbc/7i6ZTV/GXWOJ8vG
	BRq7vKu7A0EjtweaD3gmd8SOzBkGZDUw5tLjnktuV4o55L0eHKIysxEjibWuZ4Kl/Qx4tRHEHN/
	MQO4IKtoayrMgY9MsvQYogNxl9+KjNmPdEZzgiZDaMWJk2qgCwKN5v/WQf04kYuUVidwNGvNO8w
	pJNflpCb/X91BTyvXIQwKgSDHshNatt1GlQotLkYcE3F0Rlg1eVKl3OeSRhAtbUBU/fllZgYXZe
	pnjGhkaOrcFpWYURm3rZVdbBzJFbDDjqsC64ISQQMVa8//AkyEKeawzou5c9UeerJOFQBzVJq/L
	RdCYUY2D1lBn0Svp0IyIH00HFY+ZEg2lWRHPAlC/pzoqOkFUs5VIoOjGD8nL1ie5bBzkMmINNW0
	Yji26iNMnUiD/8+DiTPszR47vkbmsRiduYSmYXmmaVJOid15bETV4MG8Lj9n/s8fXlNHCFLhMVN
	UUwfor43axIgYKALprTqqPtMOxpk6avZNoeaz9LIZFmofQuy1jCWfJ
X-Received: by 2002:a05:6820:418b:b0:716:c34d:c2aa with SMTP id 006d021491bc7-71ab509ed1amr5396398eaf.37.1794733611590;
        Sun, 15 Nov 2026 01:06:51 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab4338765sm6198902eaf.14.2026.11.15.01.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:06:51 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 02:06:34 -0700
Subject: [PATCH v2 1/3] dmaengine: virt-dma: share deferred descriptor
 retirement
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
Message-Id: <20261115-submit-sun4i-dma-callback-lifetime-v1-v2-1-fb7d258702f8@gmail.com>
References: <20261115-submit-sun4i-dma-callback-lifetime-v1-v2-0-fb7d258702f8@gmail.com>
In-Reply-To: <20261115-submit-sun4i-dma-callback-lifetime-v1-v2-0-fb7d258702f8@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
 Maxime Ripard <mripard@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

A cyclic callback can retain its descriptor after the tasklet drops the
virtual-channel lock. Collecting and freeing descriptors during atomic
termination does not wait for that callback, and clearing vc->cyclic alone
only cancels a callback which has not started.

Provide vchan_terminate_all() to clear the pending cyclic callback and
move all channel-owned descriptors to desc_terminated. This also retains
a cyclic descriptor moved to the completed list by an error path, without
requiring provider-specific descriptor-type checks. Already detached
completed descriptors remain owned by the tasklet.

vchan_synchronize() drains callbacks before freeing or recycling the
retired descriptors. Repeated termination leaves them on the terminated
list until that synchronization occurs.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/virt-dma.h | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/virt-dma.h b/drivers/dma/virt-dma.h
index abf2ae737c30..d3057fc85a9b 100644
--- a/drivers/dma/virt-dma.h
+++ b/drivers/dma/virt-dma.h
@@ -199,6 +199,24 @@ static inline void vchan_get_all_descriptors(struct virt_dma_chan *vc,
 	list_splice_tail_init(&vc->desc_terminated, head);
 }
 
+/**
+ * vchan_terminate_all - retire descriptors until callbacks have drained
+ * @vc: virtual channel to terminate
+ *
+ * The caller must hold vc.lock and prevent further callback publication.
+ * Descriptors detached by the completion tasklet remain owned by that tasklet.
+ * All other descriptors are retained until vchan_synchronize(), including any
+ * descriptor still referenced by an executing cyclic callback.
+ */
+static inline void vchan_terminate_all(struct virt_dma_chan *vc)
+{
+	LIST_HEAD(head);
+
+	vchan_get_all_descriptors(vc, &head);
+	vc->cyclic = NULL;
+	list_splice_tail_init(&head, &vc->desc_terminated);
+}
+
 static inline void vchan_free_chan_resources(struct virt_dma_chan *vc)
 {
 	struct virt_dma_desc *vd;
@@ -232,7 +250,7 @@ static inline const char *vchan_chan_name(struct virt_dma_chan *vc)
  * Makes sure that all scheduled or active callbacks have finished running. For
  * proper operation the caller has to ensure that no new callbacks are scheduled
  * after the invocation of this function started.
- * Free up the terminated cyclic descriptor to prevent memory leakage.
+ * Free or recycle terminated descriptors after their callbacks have drained.
  */
 static inline void vchan_synchronize(struct virt_dma_chan *vc)
 {

-- 
2.53.0

