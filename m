Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794010006;
	b=VvNrEeNWjLztQiW9WYyQPzIpEchZlaRj0zt1GlmWqJqZYXkvIgjORRCYYX3vzYVzW3eH
	 sBL9JnHtAjbXbYVbKWLSfL5UVGSmzoXdDL2IsnuyIwu88FgIG4k8fEoEiRzdHfj6LD1EH
	 lRVtiorAEh1Dn2WuZK/ou9F/SULxfbr1sjHmonbNpceK5sxpuwXigS1ZBb+/FAuHrar0N
	 3J2e/ZeE2balK+/5tMC+VZE41bcPcUZ7F5YPU3A0yW4Q04eWez1VSzi1/5jQ5v552m1ao
	 yoR7FudGkQNGkaIwD2gID0d4cupqsXJ/86JxHuB8tmhRnukpIA6qrsx0yS+o9C4HW5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794010006;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=XP2lKTQGAydL4R+xsCm0cY669RVVtn0VvIRtylww03o=;
	b=mUFlW6Hr9sqUAxcmDpxbNJ53DRZ8skmC75RYBEK1S8avq3vaBWvfNwqz4p3dMKCF/iFZ
	 8bUQ8WieZYbpxLMIYHc2XgwanENIi7O1W/aLNHo7wBOde7y6Ud9ssKFWsPm4rw5aJ0F6h
	 FGaDX2IV5tT26w6qzy/9kit+yofADqJhctTsUvgQLYPA/tY7xuVjsRV6f51kyQUqtbvQM
	 XGUwmYywtSDW/0ZiEXfel88NsvJk4PruGMlQPt/bPfQgIreaQr0xIekV7OWW7ASFKNXnf
	 cgQXwVx8GgzPO8F77h5im6LHreppLr1eSVv1NWmdDK7856z9osMJ36pnXL5v0knhMjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eRwlbATG;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=QaItErdm;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB3B606D804
	for <dmaengine@vger.kernel.org>; Sat,  7 Nov 2026 00:06:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AB3B606D804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eRwlbATG;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=QaItErdm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794010004;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XP2lKTQGAydL4R+xsCm0cY669RVVtn0VvIRtylww03o=;
	b=eRwlbATGuePqRoUfDSZ9qs0RrDdYZ+KAJ7W8YOSwyruxWr6QSwtuhfpmSEKbs0RkuvS3tq
	nDRF7ibxDb2QRowCIcx4fyeXiTxtwfid4l4jQyVnUyDmgMfNi5M3QTGt59FIsuMAveEHIT
	gklSeZm9ZhWhFE3Jsw4LD7nznNwoFKE=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-JckK_1TbOBChM1XNntz_0A-1; Fri, 06 Nov 2026 19:06:43 -0500
X-MC-Unique: JckK_1TbOBChM1XNntz_0A-1
X-Mimecast-MFC-AGG-ID: JckK_1TbOBChM1XNntz_0A_1794010002
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91e9ea7642dso20103486d6.2
        for <dmaengine@vger.kernel.org>; Fri, 06 Nov 2026 16:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794010002; x=1794614802; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XP2lKTQGAydL4R+xsCm0cY669RVVtn0VvIRtylww03o=;
        b=QaItErdmqNV9RHrJfk1jyRqVWmy8RPzwOr7/Gtt6w2WUgRRJ6D0jInjmF5bCO3A7AK
         FR3SVFDmlMjislejJMo/Ar10alCPHZEt2I8tyH2fn1GhkYTU8kW9oh8J1iyffzPKMiYZ
         wylVm2eqyZLnRSPbiXmrQsX7EuqfZI89sCkv0aXfetBOr6S8r0FrtWWER2kcOpgac6Wm
         Iv1NN56YIdQ2ABVw+xx6zF7IfZsGq4rodUcM+kHHpmNwEgFmAlcImhz2wIqnksbEtRq/
         z+O2OzBY7HH3iPr/MQF0JKQWyy0/UoPnofXD/0eYC/NfyziFx6u0BH8ubf3Yh8qNWVU4
         /Dlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794010002; x=1794614802;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XP2lKTQGAydL4R+xsCm0cY669RVVtn0VvIRtylww03o=;
        b=0Z5o7iU1k0He4DCVS/A7aPIyfgvuZYwcPv2aXIeU3VHc1TyEYzfkx2KZdpEsLR/yvE
         yIQKN+dduPwdmB8rER8yXU3Tkao+fiuwG/64hJTZHRvyy/KXaztZRX2NmKF3oim/CG50
         b+ZhF5Jxsapl+SLvL2uLYc2JzpTnXcizluR2QIJCohCPMs3CZ2Is6Tg0sQjWjQpLs1Mg
         aN98u9kMey7Mi9FtHBVNt86ePBYLGbT2JUbB6VZF1eu/dCXZNmx1O3jETNNDkByrL6IQ
         c314UUpASKWGOOcGIopp2n8mEaIY1UCY4up3VVmxRiffQ0mJyQ8HHGULC2BV2siJB3MN
         LlRQ==
X-Forwarded-Encrypted: i=1; AKwUvBy3vzcGrd1wJ1d+hADy15NLsoUTN+lgu0DXKTVykeW32pkAjhi6C88SpEYVzzAo6jyk9gcolPisbLc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/EwkitpjCoN3iDyCbasL7512E9xldDXzwk5IrT9+IaQDTamhsG
	t6R0X6Wzx0/bNZ5qWLYWmSXsa4CfD9WajMuPXB1bkmTzX9KI7yKSuHtg9sXoZqUSiqmt8NFHD6g
	Wu6CLPZYJNYN7vmZH7g4KSt5XMSRAVtV7JIRkqVzJGHUxBpKNLbsY5ITyS1tfVQ==
X-Gm-Gg: AYBFou1h/uef26OzucTxnav45YgHhl3iyuX26z73eExWsGtcdAcwanpU5x3jRWKh7uP
	kymQ6XphoKPqWxYOZOeiKDI0vTVI0tuPcKNqkR8lkIimZqCKFJGm8CjoxXxr+6qTKVwhHTDn+nb
	4IDBFg76bkkm/KPLvy2q63F1hwKacY9m/9J9kCkgdpfw+iW5PHq742nX/zUXzhdEuGM1orYg5He
	N8XwGr91Hy0O0OiHwCoJTP1bSzpHujyNcuRULLLSosWFmceWKDXjYXXF6cJZTIdGm02DdUdN/w+
	5f0tY53Ejbj640NTfqe88i0ULk+cn/X3V1OU52rsP1bUgKUyEJvSfDB7Ar1hLvofa88dDLLGq6y
	ZMgjVb1GDOcspljjPWNOD8fQ2Y7KWLbmI/5My07RavfblE0BCQU4n0alIB9jhWxQ4jyScHQ2oHC
	I4XMRjFfyy/zBek+jI
X-Received: by 2002:a05:620a:468f:b0:93e:6325:ae6d with SMTP id af79cd13be357-945f349ce35mr704445285a.40.1794010002558;
        Fri, 06 Nov 2026 16:06:42 -0800 (PST)
X-Received: by 2002:a05:620a:468f:b0:93e:6325:ae6d with SMTP id af79cd13be357-945f349ce35mr704441785a.40.1794010002132;
        Fri, 06 Nov 2026 16:06:42 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6acc4a7sm31624376d6.44.2026.11.06.16.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 16:06:41 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 06 Nov 2026 19:06:09 -0500
Subject: [PATCH 2/3] dmaengine: convert to subsys_platform_driver_probe()
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
Message-Id: <20261106-dmaengine-subsys-v1-2-780eeddbf3ef@redhat.com>
References: <20261106-dmaengine-subsys-v1-0-780eeddbf3ef@redhat.com>
In-Reply-To: <20261106-dmaengine-subsys-v1-0-780eeddbf3ef@redhat.com>
To: Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Paul Cercueil <paul@crapouillou.net>, Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Manivannan Sadhasivam <mani@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>, 
 Zhang Wei <zw@zh-kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
 imx@lists.linux.dev, linux-actions@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=1356; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=FjTOp1M8Xy8WBCnxDwFzONX6zQMkkI1R2AYzFx+nwrU=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLeZbdoi/pLp60VjjwvcUxslVrirb5DV/utktpvPDq5W
 Wn/wb71HaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEykdQkjw6JqyU0+3VVfSzWl
 u41X9l86OG0B89PfCwV8v3te0lN3YmD4K1PKxrDgtUqx6oLWQ+/ii6VYfpw6XSt0c6OA5Me1z50
 zWAA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Reduce boilerplate code in these drivers and convert them over to use
the macro subsys_platform_driver_probe().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/dma/imx-dma.c   | 6 +-----
 drivers/dma/ste_dma40.c | 6 +-----
 2 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/dma/imx-dma.c b/drivers/dma/imx-dma.c
index 81c6276436f8..8e0e82df8c5b 100644
--- a/drivers/dma/imx-dma.c
+++ b/drivers/dma/imx-dma.c
@@ -1238,11 +1238,7 @@ static struct platform_driver imxdma_driver = {
 	.remove		= imxdma_remove,
 };
 
-static int __init imxdma_module_init(void)
-{
-	return platform_driver_probe(&imxdma_driver, imxdma_probe);
-}
-subsys_initcall(imxdma_module_init);
+subsys_platform_driver_probe(imxdma_driver, imxdma_probe);
 
 MODULE_AUTHOR("Sascha Hauer, Pengutronix <s.hauer@pengutronix.de>");
 MODULE_DESCRIPTION("i.MX dma driver");
diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 2e83503f71d1..4fb54c8f2d23 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -3990,8 +3990,4 @@ static struct platform_driver d40_driver = {
 	},
 };
 
-static int __init stedma40_init(void)
-{
-	return platform_driver_probe(&d40_driver, d40_probe);
-}
-subsys_initcall(stedma40_init);
+subsys_platform_driver_probe(d40_driver, d40_probe);

-- 
2.56.0

