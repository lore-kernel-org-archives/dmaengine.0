Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794010010;
	b=oq3cmkQext7/qMn6Vo+O9duCPyYM4HtNoKR5vmYCeBc32vrBp4Gk808wS2FzxBbxq4JH
	 GRvLP0iea0srxKc3nbtC7AEtjFbxakSVEsW9K+Cj9hd+FcVWzmcw0KD3Swp57eiJ43XHq
	 C1Y3lVB8g7x0JRDlaMOiW32BwaQwsZVPvSfrCBR442tittIms1bHhdOj6xZjDM9Ej9NjU
	 JZhw/XKJooba52nNL4URjJFk8ZK1iOFWcApRznmaw3FGd1J43bsNIgQG/4UT88B82LZAt
	 oVLfyxCCny8iaGTP1skLuqLClnRyahlf6BH5jWzSvirqKVzcgCb0XzIxfW6YMVy7PAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794010010;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=b1jw8/k9HF1Z0QFcfzQluiREZXrKVRI5j5BkQVxckCU=;
	b=YzLroK+Kui/qGdMY/DJe3IAeQmgv+0ixfHZXa5W2yDV4OTc3dqMXFR6DQmdcdLo3DPlx
	 ayGUkaqVFGHt6J8PeE//auhF5MOEBx2I+KWfQDNGY2kvsvpEdWzyaJsbpjHeMVkGqPARm
	 MXGy+K5/rXKixilu9THmBk1fk6Wiy3f/MRBBfgxdXQTxu2j1rdx2EQM+utA55xrhyvk8W
	 OiDdTPKrE2YDzf1Onb2qowlGQ2tYWX27KFFYya3hINTkNkycI8hoynGuwzhioFCOZ0ZRU
	 HZxTBMpua/gUPoPZq6iOqQAYbd4kmekKRhqSvwrzsaFMbDKVfiUuN6NDu7OHXQ2cdvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Jb8hBDAm;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=OlNn1TSB;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43DB606A326
	for <dmaengine@vger.kernel.org>; Sat,  7 Nov 2026 00:06:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E43DB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Jb8hBDAm;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=OlNn1TSB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794010009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b1jw8/k9HF1Z0QFcfzQluiREZXrKVRI5j5BkQVxckCU=;
	b=Jb8hBDAm0JHwIBcBnEGlrMskZWWKmo3T1uWoWwLPtamxQnUjgLaqjJ0ghTUuxc7gsa8MMH
	iVkA80ZQJ9NbPAtUI2BxGHXs4CetkfrCBKt4AxYhEbjJwG0mOrRw0Ok4s0Xx8GB5s4nT//
	rGZy12dhZ6eWXSZD7sQiaYIdUBWinDQ=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-261-jjFqG20wPtONKGWcwEPkmA-1; Fri, 06 Nov 2026 19:06:47 -0500
X-MC-Unique: jjFqG20wPtONKGWcwEPkmA-1
X-Mimecast-MFC-AGG-ID: jjFqG20wPtONKGWcwEPkmA_1794010007
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-532f343a55bso21008281cf.3
        for <dmaengine@vger.kernel.org>; Fri, 06 Nov 2026 16:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794010007; x=1794614807; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b1jw8/k9HF1Z0QFcfzQluiREZXrKVRI5j5BkQVxckCU=;
        b=OlNn1TSBp+Q644ps2PD/kg+ZZ1m5BixFajPnQ1ISTrpZNxU6GlpiChrFxEKztSscjx
         H2y4/xkRwJpMVitjkOOgIEFqxqwUWyPzWkaf+E8hVX5N8aEOADvUOk3v1kEknjZ3Fj+r
         nB/4MyBJxc3vEE9VwDFnCtW+NC54hvmzjW+M+hxk+9FYuXZfEp2A+yGU8/ZIWMsk6XSl
         NNwjUjqTY5HyILNctO6raOqBzRvPP8iP2dsTAvSoYcR3VKhK5QEHbdZ1IGHOg85NBNhj
         k+wqqIGbecZkIz5yO3itv5zl1pBJne+aZqGoWmGWIZIWEZl0GZehhjEDdRecTnL05ndU
         mXeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794010007; x=1794614807;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b1jw8/k9HF1Z0QFcfzQluiREZXrKVRI5j5BkQVxckCU=;
        b=i05RctLnu5r2PoILxYK1CLCCv4azQHG3Hj6oppV//LqregFXdDPL3ebPTodQs+hQm7
         9Clx9L6/5p3l79gB9mAMBVONceD4zQdehx/bMZxGofNA30hVSnaiXLBG81coWzvbFbVw
         U6WwMEHJwmaFQRqfowY4saoBpzIoIqynjPqP2Gkm/dhCbl65ako2Z1Iy+kHCVnvAjAhm
         oggxDDSX2C4tyEJ/MkeiEtaiRB3ZtvQDqJ843pP3FXOeTkWHHPt5io/Pp21X3pwEbouK
         ikGIeXfly3qrgJNZRzeSvlI31KTiMXD1WyzJcBWsk3KwvYKtH1VCdKvAHw54ktST5zhF
         NyyQ==
X-Forwarded-Encrypted: i=1; AKwUvBzAmiFE1Iird0nyvAVIH6AEeVjxn3H7nxYH6G6yAyydMnqNL37RbZ4EM/g1fnynZsl27KI1UM7Ej+k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qRZlVhHIkTxv1NaSXZ9O9cSR1XQwbKK8vWlmBvgoS7ls6JhxB
	6joM2gnapvJ4wlv4t5Y1YK8F+hUNdB6kIfzPi/n3U2sUqFsGuLSq6sgo8PpM7MHs/zTrM8NmVqj
	ZXFOF4g7u/f3YAz5G9Dh8+5hGJIO0kH6Pm0QDjESRmSx9fPwaUjlAMFW0z74oJQ==
X-Gm-Gg: AYBFou1vKoO2KcH0hnn73LPeiDpXqUSkynNk6+PGneljzhjedHYIH6U5KQZTf1vYPTS
	3h4ZPvOdYZqd326ESwOFpccGNDgrtYfP/zQ3oPGKhn1Q5FQWLh1tR1l2GJJ7EiS0al2wB5Qjxx1
	QO6GlyXwDdHEis7aD1TmuXfYfwFhmTD50EfSh0Ne5iGb1hwcta8/ANyITHjzDwrcogp9ZbBvEia
	ZJIsUP0t6HEMtTMG1vQtVCUb4MekUCZ/C+4YY8qbCe7jOrf0KXnqRHm1vjqedJutkTwAdUCWbHG
	YKRnkiqIo5c/UZOuGWTvoXEBc9zRcmUOQYv4VBKaR2VMl43jsU70QdHn6fv/uC+ClyuEkqsfwvJ
	Za3RTbhITHeDjck6RO5HUqbLv+R4vxY+j0AxRBdStHDfBZT3bLLN+K6B2oi4OojZklkM+jNwJeN
	SiddmTr4WT3emkKMRO
X-Received: by 2002:a05:622a:114b:b0:537:f05d:881a with SMTP id d75a77b69052e-54e132997ddmr61751621cf.12.1794010007232;
        Fri, 06 Nov 2026 16:06:47 -0800 (PST)
X-Received: by 2002:a05:622a:114b:b0:537:f05d:881a with SMTP id d75a77b69052e-54e132997ddmr61751141cf.12.1794010006668;
        Fri, 06 Nov 2026 16:06:46 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6acc4a7sm31624376d6.44.2026.11.06.16.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 16:06:42 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 06 Nov 2026 19:06:10 -0500
Subject: [PATCH 3/3] dmaengine: fsldma: convert to subsys_platform_driver()
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
Message-Id: <20261106-dmaengine-subsys-v1-3-780eeddbf3ef@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1227; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=hy3g6mWddGYLX6Myo7kSoYtQp+hY5Hbo/vUsysOb4zQ=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLeZbeeNxabtVqgmXFuKMOEE2yy/Scinn4R5Zj7TWhOt
 atoruLqjlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACbiOouR4cR1jkNqh68wrEm/
 stlDUKbx8PxggVfG0h+OhJx8eL8//yQjw16uPZumb/y3PVJc7N7WsJVuGVcamc2sSnpsTuX05Pi
 UMQAA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Reduce boilerplate code in this driver and convert it over to use
the macro subsys_platform_driver().

Note that this driver previously displayed a log message during init
time, and this change drops that message.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/dma/fsldma.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index 99a878ed1444..fd3dca7616a8 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -1431,19 +1431,7 @@ static struct platform_driver fsldma_of_driver = {
 /* Module Init / Exit                                                         */
 /*----------------------------------------------------------------------------*/
 
-static __init int fsldma_init(void)
-{
-	pr_info("Freescale Elo series DMA driver\n");
-	return platform_driver_register(&fsldma_of_driver);
-}
-
-static void __exit fsldma_exit(void)
-{
-	platform_driver_unregister(&fsldma_of_driver);
-}
-
-subsys_initcall(fsldma_init);
-module_exit(fsldma_exit);
+subsys_platform_driver(fsldma_of_driver);
 
 MODULE_DESCRIPTION("Freescale Elo series DMA driver");
 MODULE_LICENSE("GPL");

-- 
2.56.0

