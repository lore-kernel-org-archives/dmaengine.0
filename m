Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792616806;
	b=A8G7zsb6neL3HX6kY5qtQqtL1gySbjzLM5rUrNKCJxkVgBGfa6zM1+mvAE+2vzWoZAsJ
	 Bso9IjoUN3Az3BXTK7TFOPbHfN5NvX+a/8geDLvzw7tFnZcTh8nKfHURu44u71Xmp/OnO
	 whdZ3Ej5/YYydRyAQRhoWoU3V++nCmZbhM+upSGNuhdyyZguRipeSx+LefNnTow6U4jaR
	 m2WXAuQ2+o2caZvWOsARBaXM8xxr+Ua25/xS8VrfRxukRx1/sOipa8SKz1ayKqVgtlC/+
	 BjlHw0ei4zk4hsnaj//zvM7pzbpSe9vwPnG0qMb6qW26Hy5TYvG8NGCTjAmEd34xo7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792616806;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=fxNhFdCnRx1TnZ/VZCHBg1thsLr/kiS3HyDFHely7YU=;
	b=QX9XLCNHhj+k/3MBpNZZuKbXO09T1Ki4jMfAbjP4/ej+bbkCsD37q1mizU1natIRV1je
	 Q7sJfXD2kqub26S1zc9cJYRywClG6o3J6/Y9brar0wbLyWZAt8tMbCEiOIE/O8Xc9lK0o
	 cgVKDKmZFrSKo6BjWbwPJfNIq5PIVRimeV3c0hiIPXPQDF7lj7q8dPGcqk15nj8IwZXnX
	 kDaciJpn2dhxzDZMG93XFdt1ajWjnIq1XWn+OP/QVO6Bmhd1N9oTtia2mU1gEmh2lWD8M
	 s1MvnXGoA/mNvANx8hJx1WxAZ4iJ63NsZnJX5Nb21Rl0tRBpXMK2PT9heMIW9OCsdcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SPDfOhhE;
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89F8606A31B
	for <dmaengine@vger.kernel.org>; Wed, 21 Oct 2026 21:06:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B89F8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SPDfOhhE
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-847ac7ccd85so833292a34.3
        for <dmaengine@vger.kernel.org>; Wed, 21 Oct 2026 14:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792616804; x=1793221604; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fxNhFdCnRx1TnZ/VZCHBg1thsLr/kiS3HyDFHely7YU=;
        b=SPDfOhhEl+TiGBdv0TUrraxxSzgweR9jfyy+x8DxEwxlbVs7GkJNsiTQxewh5RYIV4
         fq1v+4/l4bMnaTSRmoAodCrb5sY2p0qRAu7KZf6Dpr5d6yWPdAT2Scx1W+9vcWf5jaEg
         mimQsNyyotFRJg+OlwgTg5vgA09D45umNmkU1mV9efBg5TOm0k+Gj227kp8H2YbQ8+Wd
         Bm/ZPWE3c42h0VMk7m7D+0vnqOy4qnkKyD8zKPjSofU73SgdMU0u1BSC+g3kAvPgyLOL
         xa9Bs7PTXAWI5FaRCqpZC076oWQ8jwBjNXwMV4DQyzwHEiUkUi/jp/jzIrV5aPhSFgba
         QkvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792616804; x=1793221604;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=fxNhFdCnRx1TnZ/VZCHBg1thsLr/kiS3HyDFHely7YU=;
        b=Ml6JQ3fXSzJGAeNmpcdXr4fwm7XootZcO3fYxi1OqDCgNaRPpTIJS5kWetqVj7CpLq
         Zuy2gidZdWgiAK7XRew6sPqxxUEoAsWlSLkofwjAhMWD5rSmBxy/AuXZYi8ILdNG3ip8
         69X4uyXLyOfsA6O8LGI+8fSPHUOiqAOjoIAGQWAooV0mZRENlRLbCBWgEe0zDEIsI8KX
         qPIRodTp/6Irswp42dFLOc2Cw/ymdpPNDxiobs6/ZvuwkzAeln7RCx6Q9WGdShSoTHpl
         CUQPbrG0C6k5ANT9nE4IJzpjqtByqoqmIUnzfVaG3/NgqPFStOqdfETJfDmt0Uociyrs
         q1dA==
X-Gm-Message-State: AFq9FYJXGoVrS0FC+NuKr8GLXWlgYTo8fiEPMP+8CUf4rJJvbhhiCOg4
	FdAtOiqhAfZV6TQcdGn1B0Qkg9N1kRxozkkgwnA0fPK0ygTdSI1JgGAK
X-Gm-Gg: AYBFou2b0t3W6SywWcaA6e8m8kFZzqv0dBylVJ9CAdC+rp1ZgLQQNrwlj9t/tukxvIV
	CNusOTWnRFtbh5SsYMKumFjYVch/6MrXRoh1olcvxMtkDZXG1cu+16h4qF4gUeKC16AW2wRvxP/
	vX2TgRqUDcrc3TOxdBM/HdayV1RqVhxmc5V1sa1zJZrKboFqWArHlUTq+5NU1U9HDCrSV6gvK68
	DrnxcENmqp4+q1U7pXogMtdOWU4LWL+wPu+6SsnAZls1mmRN0afdBrVvkhjZk4F4zIeu5vMfQOP
	oFMazColEruCk6th+QxWWOWsrWxhAvtOQa71pF8UxxrLUFWCxLoVaucv0emSFyBa0HqF2MuY488
	aJxP+flhDHPQxuQ0GXhE3GW291jczSIVIPVjzoW3mIZRAOj1QeWbxgSm7ZnAl0ECOD5yPPLofyr
	FFWF86t/g4gFM+TpDQatMFB/opgy19T1zwcwBaelVJJdRLhTGAyW2yf76G9SpjlwhfN9VV8AIjH
	sRjdFMVvem6YeWKErI/mI0c9jEgQ462eKYxJ+RETgvyejTAHBJ7A2o0jsCSOKsXElg/xYot0QNr
	nU1aaRXjHVoSBbDCAfhCE+OnfWGIUDMb59fWfQPhw4vnD1wiJ+Yi0KLGdJ2eKioy4v1AKjLPkJ8
	TcvW/oQslO786inJUpux1PnS+jehVHg6tq6HZJ3KW+31v75M3IDVq0teVqQPi/I6kSFHIvrRRqd
	WgXQ==
X-Received: by 2002:a05:6830:3495:b0:81c:a8c5:633e with SMTP id 46e09a7af769-84d08afde73mr2463140a34.11.1792616804678;
        Wed, 21 Oct 2026 14:06:44 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84cbd2d04b5sm3466826a34.14.2026.10.21.14.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 14:06:44 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 21 Oct 2026 15:06:33 -0600
Subject: [PATCH] dmaengine: sun6i: bound burst selection before shifting
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
Message-Id: <20261021-submit-sun6i-dma-burst-limit-v1-v1-1-41a7a476ef66@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWN0Q6CMAxFf4X02UY2CUR/xfCwjQo1Us02iAnh3
 +3k6ebctOdukCgyJbhVG0RaOfFbFMypgjA5GQl5UAZb29bU1mBa/MxZQ1rGYXbol5gyvri0q8G
 mo4u9dqbpDIFaPpEe/P0v3PuDVfGkkIu2XHiXCH10EqZSqZNkZKHz8bfvPyr+VHqlAAAA
X-Change-ID: 20261021-submit-sun6i-dma-burst-limit-v1-47e32971471e
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

find_burst_size() tests BIT(maxburst) before reducing the client's maximum
to a supported burst length. DesignWare UARTs request a maximum burst of
one quarter of their FIFO size, so a 256-byte FIFO supplies 64. Shifting
an unsigned long by 64 is undefined even on a 64-bit CPU. The fallback
loop can repeat the same invalid shift.

Limit the search to the highest burst represented in the controller's
nonzero capability mask before either shift. Larger client limits still
select the largest supported burst, while smaller limits retain the
existing power-of-two selection and the zero/default case is unchanged.

Fixes: 7178c3586ab4 ("dmaengine: sun6i: Choose appropriate burst length under maxburst")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 7704b016aed8..a8b12262b3c3 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -590,6 +590,9 @@ static u32 find_burst_size(const u32 burst_lengths, u32 maxburst)
 	if (!maxburst)
 		return 1;
 
+	/* maxburst is a transfer limit, not necessarily a valid bit index. */
+	maxburst = min_t(u32, maxburst, fls(burst_lengths) - 1);
+
 	if (BIT(maxburst) & burst_lengths)
 		return maxburst;
 

---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20261021-submit-sun6i-dma-burst-limit-v1-47e32971471e

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

