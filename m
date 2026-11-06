Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793949975;
	b=YYGc1kT9jKdMisdu/Nu6TQVAdy6z34SFj2zJ5gRtPi9gc1qFzUDXQGOKVJ/o6lwmuVxR
	 b3bnGXorqAvly3lUV26LACn836069z5pdUQzhUJTDDVirO20n3HK/5IzWuIivUnbUO3wh
	 4PiYbYMx80tA1qsCxHqyNXZ3FXAFzV2A3A+HSlPewybuw8Uj5zT1shBt2a7t8xr34wGcL
	 lRzqME0pJbVfUCPw3Ucs2IgXmXFeMvVMYXbGYg59Mwm2mo0jHA6NVbt2361EooHn3N/Q3
	 LObsjfz/GhTOhYRMoRCyYqJmEMW3kCvYTO/xkrbt1Tu2dHX884jIqWGwbFTYU7h937Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793949975;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HtJkfenG8lvFVEaE6QRe6qjgr1soq+sJRZ57WrAL0YE=;
	b=rLNm7JF8aGVwy84HO1IWNRF11oK5zsmMPlNyvG8mslDYErYjnS2zeyHIGHhthwzWWQr0
	 eWAuUvaBBD0Y541gbvjLYzEQh7egW7JmDuubooX9gN+DOCqH+DIMdofd5ktgVzbeuoZ3D
	 acFg0v3/5V8ehPUIgCS2LPLgu+VGqtZq7R4LP9MummmAgstKcjlGKyw6mHHpDmB9iG00s
	 /6DxjnVJJK+3q4q8Aln/PYmVFy2fTEM8kdlQ2bAw9+eHvFv+rDBxm939w7Pc8QChwl4TL
	 8Q1j8FtaRAan7oEgTaApwid9FN1SdaekXzsFOVoePrSMhJMCOcPNDs9wrlzbyZZXK3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nmb9c61q;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14E7606D80D
	for <dmaengine@vger.kernel.org>; Fri,  6 Nov 2026 07:26:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F14E7606D80D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nmb9c61q
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cdb681de50eso133374a12.2
        for <dmaengine@vger.kernel.org>; Thu, 05 Nov 2026 23:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793949974; x=1794554774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HtJkfenG8lvFVEaE6QRe6qjgr1soq+sJRZ57WrAL0YE=;
        b=nmb9c61qzXEgGvlgzwcJ/PwxYR1fZX/IynQhLVwOBco8DAhpuncz+xKDdrOBc94Mwt
         VVBoqeIErKjj/mgyanew6pk8us7e3/dyEYcWFU6QUcPvCj8ZnZDN3iOs8dPhvstU9YVg
         T/GBGB3RuBmWGfGv93MpaZWaR9yaDRTMhWNeler0YDpv0ZVwGGr/AgZQn6U5BXWahQDY
         uTd3WtwqBUrxzYMhOExJYXNouB0sLQkvV+bxBuQ8H/ry1KTwQXokYBC3IU/Pr/ydRRFy
         7WKaFACHmYdLbz4tXpA+5ZBBnhWdGVFQBg9NcHxKSLuGpZxnhtUqYcjJgrZ5jXrQ+m32
         //mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793949974; x=1794554774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HtJkfenG8lvFVEaE6QRe6qjgr1soq+sJRZ57WrAL0YE=;
        b=hgsCDpG7T+i5AUYkHWIlqd3/6XEYJzDaVMgABIwKXvtXiaSXxjUFuUmxEfK/X4SXht
         EPxlHebWtxglHRgssZGwdRsnZTSG1h36WEjTXu9E68lXMXszD78HgYvpbcOHnhWny/Ze
         /JNn9fojh2RN6GZFl8gfCSahy8J8HCyEtgnrYuIq2mQeQvs4v5y5DJWG7rxgRc4dkiIl
         HAx0duuk++h14NXNX5MRERVWOfiQcdY+EeSPHs4xcx2Tx1gJYUzbaXO1AEcAhQlIYpQD
         wyKbtO1PScjQ0Cx9ZdkaE2nahGWsnbKqM0Day+Kcs/U6SwkTw6yzJTiRLWO83dqhxkFE
         esAg==
X-Gm-Message-State: APuU4Z+/umnWCecOxanShxyOlJmxVuCY7szNb2rKh9bb3KV1kkt0Q+i9
	U4gG/tixZrnEtgU2xYfz9SdAGeq+qfJz6WPvwUtdiuhXf+eQfTg2+Zo3wzAWhA==
X-Gm-Gg: AYBFou0GwGvtf/NRw9etrHsGJjY/J94vDNXYiEZN+PFArWz1Z36HLWaKrRhmdBonfe0
	ixarNtpA2dwtxIVr3vVjVPYVZL/StCIEUGHEIXvbSnXw1JmjYz4NoZu4pGfS1g6mPCBP8uLJNsG
	AQGvCPrIVOeufGj01H+CjHrnIZ8CrYQP2jcLhWZhFxqaV6dDVoJjCP+mS3FXyEena06TJWw+Ofm
	+dfH86HLIBFrCdXfeA6toEBUKmwct32NLaCYXXVtti+3fH1pPX5pgo07ic5E9Jt/Ov6tCsDbaxC
	6slNIvwmpHQKiFV0jNc6t9tTj7Yczt/I/RgqRY3FJqif5ua8Ri44etBquc6JPO9khU8+zsbpFDG
	s7Lcas4kjfgoKeOk++w2QrTiSXEhwO43GhzuELkT2NvvDzFqtDtBaFiB4UpVlF3484CuFfQ9A+Q
	sjuomLnMn68vpHejGGY9dYE3oEJyIXIN0AZy4vMOAsyDNXQI7/1qHh/bo63QtreIilv6/aOllLb
	QqfZPwilrDkcGubeKK1keIyuqTwXJL+ScIdwd/A4/u4tYEAL0iR5PoHo6v4DieBaoMbLG+6wOVD
	drTC6l8EWjTuMsCUzf29/PgrjjrlVy3slhgXpJPIaXK59S+8NplnNTe5EkK4+zxa9Je1GoIyaw=
	=
X-Received: by 2002:a17:90b:2649:b0:3a8:86b7:ad95 with SMTP id 98e67ed59e1d1-3b0db723881mr1592667a91.60.1793949974260;
        Thu, 05 Nov 2026 23:26:14 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:28::4:396])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47d89976sm2633715ad.66.2026.11.05.23.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 23:26:14 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: dmaengine@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dmaengine: pl08x: Release the reset before reading registers
Date: Fri,  6 Nov 2026 15:25:58 +0800
Message-ID: <20261106072602.77560-2-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106072602.77560-1-mmyangfl@gmail.com>
References: <20261106072602.77560-1-mmyangfl@gmail.com>
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

amba_read_periphid() happens to release the reset. A node that carries
arm,primecell-periphid never reaches it. Take the reset shared and
release it ourselves.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/dma/amba-pl08x.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/dma/amba-pl08x.c b/drivers/dma/amba-pl08x.c
index 543c2eb8cfa8..9f5e4f5fb877 100644
--- a/drivers/dma/amba-pl08x.c
+++ b/drivers/dma/amba-pl08x.c
@@ -75,6 +75,7 @@
 #include <linux/of.h>
 #include <linux/of_dma.h>
 #include <linux/pm_runtime.h>
+#include <linux/reset.h>
 #include <linux/seq_file.h>
 #include <linux/slab.h>
 #include <linux/amba/pl080.h>
@@ -2695,6 +2696,7 @@ static int pl08x_probe(struct amba_device *adev, const struct amba_id *id)
 	struct pl08x_driver_data *pl08x;
 	struct vendor_data *vd = id->data;
 	struct device_node *np = adev->dev.of_node;
+	struct reset_control *rst;
 	u32 tsfr_size;
 	int ret = 0;
 	int i;
@@ -2725,6 +2727,13 @@ static int pl08x_probe(struct amba_device *adev, const struct amba_id *id)
 		goto out_no_ioremap;
 	}
 
+	/* Release the reset before reading registers */
+	rst = devm_reset_control_get_optional_shared_deasserted(&adev->dev, NULL);
+	if (IS_ERR(rst)) {
+		ret = PTR_ERR(rst);
+		goto out_no_platdata;
+	}
+
 	if (vd->ftdmac020) {
 		u32 val;
 
-- 
2.53.0

