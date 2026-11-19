Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795104119;
	b=jU9Zq/82fRmK3RIqHhG/7mwV4n9hjH6MtOC/IRKM5dTSlTjmG/RQAwVl5eT2k8zDWFXO
	 wCiruCslfgtVAXws8sLW7S5ShlywAcduC9o6PAsjQf/6wzSl/nMZhh+2RDbNt5m7bTHd8
	 NgsLedVhN+faFw6zSrjmUWTVsfQVJsjYfuApHtwV4kvMcgZwiZzPuC3x6l2v8YUOBhO5Y
	 dyeaSKFrEXUJKeMfz6ECwymsZDNxkBuqU8Q3jdOFLzVUJDWcIwAIP70o4xGpL/3xWQyFs
	 6qmCzRXMt2oYju/BewiQmG315LtRK8mdXNS0/sQbVqnGGL2kR56VWFV0s/NdxhHdJVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795104119;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=efYuB219fcaN9C26HZvNi4/GEEQYMSSt/HAQ3O/Eb2w=;
	b=ORn9rZdvhb52zQ7VSRh9Yy7MeVXZA3yDu3Lf45WE9nai8FwQPFXt4I1KshQulwliWp3V
	 /Ox0ezWifHGvjbpYHSKKc/BWMsq32gYjinGP53ImPgRXsADwz83DjMP86eSIEM8tEcR1m
	 Kvvz//U9vT0IGShdhydfI9Z4RZaH4uI3aiz7AQ7ZwSAfTqK89N36i4BthQSFHgEEg1Mz4
	 6G2RBddnrijm0AYDSghBk2yEA8e3hhthfOLZgBuJcEk7HxEzO4XIs5zryykIusuRu3A7r
	 xyK/HPFUfWw1PK2L+ZA4JEjHfC1ebJ5IJcYHLfsmatEXKQZKd4oaXfwfnsofuA4n3cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bqX+sPLM;
	arc=none smtp.remote-ip=209.85.128.173
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C235C60A382B
	for <dmaengine@vger.kernel.org>; Thu, 19 Nov 2026 16:01:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C235C60A382B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bqX+sPLM
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b315dd057bso17273637b3.1
        for <dmaengine@vger.kernel.org>; Thu, 19 Nov 2026 08:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795104118; x=1795708918; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=efYuB219fcaN9C26HZvNi4/GEEQYMSSt/HAQ3O/Eb2w=;
        b=bqX+sPLMc6zRDTNZOyMiZh94eEA9Vcrfu8bai0LW+BMdAaE97eIUXYosPQmW0Q8zIi
         kYgVarK4eNDNZC9orqU9V+kZEmO0Bz4SlFR00hagzKraX6CR3nyTTV45Oyl9oBznaSad
         UeLidQDmBC/CmHGHKwLJi6/g7RpEU5XvzQoKPKr8SspVX55H5qJ+xCnPRfOdSP3++2Cp
         AxOXFJodi+ICFGcHaPYQCD+4anzri5guXZOccffgvyM3uyIMVKM11dtBl8mmUEjkQgTB
         WxyEzLWLLYoQLzjHw2LA3UAJyScJxaLNELNnEheds907V8cppFAQM9eWa3N3z4dGygG0
         ghoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795104118; x=1795708918;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=efYuB219fcaN9C26HZvNi4/GEEQYMSSt/HAQ3O/Eb2w=;
        b=wTZY072JXXkmzYZzsHUXNcH2hN/W000ar9qyOdSBKwKgyctM7JfrkgtD2dzR3wZ0AN
         LzR+xtrQkEy+/ysRRCxE3JuIeIs4mSY1g848L8oUC/3KAYPUt6EMFYAScuonmUGS8kXx
         vlbFwkRLNUfmy6izshV+Wg6lZpkdghrwdFW9bFWRLCkCeN4lPhqciKcV7SVU3FqvLmkr
         3Pr0n+cEqtUA7viejxnIvZITNEqO3R3UpGMRCYZtx61x3YAlSzNCVxCLBMwwUsrcve0Z
         0vOAw9h2D6y3KX1kdmqVxySqkcmxNGPVVhsOe4VVwROOOxf7uppkcwN2RK0/RCDz61MN
         KEzA==
X-Forwarded-Encrypted: i=1; AL+hErFUKHfRBYFcGXX/WxQDCXZOGf3c5ggoWDc+9G2NrfLjZop4SlQNWJCtuPVOYLA4p+LxZBgwQVUnzbI=@vger.kernel.org
X-Gm-Message-State: APuU4Z96ArIlJVR1MKaYrvRAyGnZ/0AWMOF9GcaOgw94HkO0uLNgPkVl
	emp+sQU8Y++qXdnyAuwWQCgVcu5VR/WL2OcpSfJ9f2blfiKycAQksgef
X-Gm-Gg: AZFdTZdjVSJ8b5Zku2WYU30v/13naOQHYIvjNpsDh667ifqfwJ+PUZIhMqqPrPvq00/
	1pOvH6Dv5sskeUkogVqo4k2Di4BrpS4emgu97iOZ64MHvCvVhD8OAAK2lKrz6yeMZLmXuLbCaoq
	VRQQrFhCpQzi1RixaqSEuNNCOmWBumClkMp3yWLm7juA2+FU29Mnll76Yod3iMaooFz/UypuYY1
	2fPCzv7E13m8uZAJM5iowkC6AHdNnSK5XRDlKYajx11xOSvBMAsiQQohkflWqDko62vYs04+9tS
	fEZmSMzu7+seAcT2SKLABo8ftSWe0KNxeVnQcy9Iiz+Q39wLXrHGPFyFSbHf9MQpidCPCRSmDr7
	8TdtHJOLLrL62Xi/mp3iVtQP171f9WHZb5LMzz13EJOlU7qo9hNtbnB1FknJuu5pxh/kbfu2em8
	3ae/2RCcHkPCZ1mjXlwTzeafDKi53L5/yBoKDboX36Vr0K4usWQ3n4FLxfxDpmgnBUfwYZv3CYV
	+HFQKN305PBvV+IJ0RUwqsV9AJ0ILUpgSVrhfbu/lp9Qa5I/Ye7fFcMalBD/Rt36c1NBczdiBKd
	qnORLgeJzdEtT+yeVyldjGLv0xXT23AMovUOr9TNWeIzDXgfHa5tMTYZYM2Swkh4DoRymdP0pOs
	N+jLGquva+RbSx1+81sojkQfyTxUZxe6SK5TRwnaxdUfKBY71h2onKMwKAvHh08OeIfGf/rrGAE
	s/EkL5KAFyk9DskVjp7UdVyeXtxHIqJ9rszz4RJQm/hfL2l4Hoh/M=
X-Received: by 2002:a05:690c:3745:b0:8a8:6a39:37e0 with SMTP id 00721157ae682-8b5204ba970mr652727b3.42.1795104117742;
        Thu, 19 Nov 2026 08:01:57 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52031aa4bsm623267b3.34.2026.11.19.08.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:01:57 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 09:01:03 -0700
Subject: [PATCH v8 8/9] dmaengine: dw-axi-dmac: require an IRQ before
 registering the controller
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
Message-Id: <20261119-submit-dw-axi-dma-stop-pause-v1-v8-8-f8e7fe60594c@gmail.com>
References: <20261119-submit-dw-axi-dma-stop-pause-v1-v8-0-f8e7fe60594c@gmail.com>
In-Reply-To: <20261119-submit-dw-axi-dma-stop-pause-v1-v8-0-f8e7fe60594c@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sergey Khimich <serghox@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>, Baruch Siach <baruch@tkos.co.il>
Cc: Mitch Barnett <mitch@accuratesound.ca>, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.17-dev

If the interrupt controller is not ready, the DMA driver can bind
without an IRQ handler. Clients can then submit transfers but never
receive completion callbacks. platform_irq_count() returns -EPROBE_DEFER
in this case, which skips the IRQ request loop just like a zero count.

Propagate the error so the driver core retries probe when the IRQ
provider is ready. Return -ENXIO if there are no IRQs.

Fixes: e32634f466a9 ("dma: dw-axi-dmac: support per channel interrupt")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index 2eeb902eaad3..531705f8f89b 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -1518,6 +1518,10 @@ static int axi_req_irqs(struct platform_device *pdev, struct axi_dma_chip *chip)
 	int irq_count = platform_irq_count(pdev);
 	int ret;
 
+	if (irq_count <= 0)
+		return dev_err_probe(chip->dev, irq_count ?: -ENXIO,
+				     "failed to get controller IRQs\n");
+
 	for (int i = 0; i < irq_count; i++) {
 		chip->irq[i] = platform_get_irq(pdev, i);
 		if (chip->irq[i] < 0)

-- 
2.53.0

