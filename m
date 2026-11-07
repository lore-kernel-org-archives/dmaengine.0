Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794013231;
	b=ruNS1S3nEvi0DaUTQxLZab10TfbW0FWF8FM7XvFjyL/CXzm7WqKShCzq+TlpTI4fGt2A
	 bdvpn4Y9hCMP6qTqrZ/JAj8qL29a4przhbUF2o4B5yi+hn85ub54XIaKMYUA+OkpJ8GmW
	 vLDM6fxOy6T9ZvJoEjp7kPHngOCCbusyKoWwmfrAJa4SA7bdrzL6O0TwjKnWjdcWCFZjf
	 B7KGsKpxVkXbG0VFyeZgUhKrQiAMaJuJFJA5oltOHFKI/LJb1XYyAAXCNivqgY8UAMg69
	 UtBZVrDIW1SgNKiQvTqkWeklFqcTVyMgO1P9ps5H8X3AZ93JsP4WtFamMEqJH/jn5kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794013231;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=16HUaCp2sq85hg8bU8Q79JWawMIdomwhEGR1N+tBFQs=;
	b=Foz+Lq44UcTqIDthtNEB3IL/CXoMmYAAnG+wkgKxh8HguoUlfFVWA/tZCxHMLdxwXQtH
	 zjJCUvklQW/X5CE5HSBDvffPth7MrzPj2mPOCuHgKFsw3QMpfTBFQinWklfZIksJiLP37
	 bQ0hgy1H6f69luwoRBiq3L1lcilU9adoc9C7NFdnm9vUqRuMHUDyCLHD2pXbGzQvDSqlN
	 hXXa81QJNH/OZEksRkfMKVI3BHn+qGXDj9A4PvkAFkmOZbKeon75SZkE37M7UBpSFs2Pw
	 7ARvo5xYclG4yG8mKTTUnSm8jb9dmBL8vZ5CkH6yp41fD3g1sPg5MMlmTzvXcz1DXDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gI1iGMRU;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="H1o1rsr/";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746A4606A326
	for <dmaengine@vger.kernel.org>; Sat,  7 Nov 2026 01:00:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 746A4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gI1iGMRU;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=H1o1rsr/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794013230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=16HUaCp2sq85hg8bU8Q79JWawMIdomwhEGR1N+tBFQs=;
	b=gI1iGMRUgsMPlVdaLVnMsbbhIm/C0tTF1cI4XBwe4X8G4NPRJFUQpAsLhyGrVnAm7r/AB+
	eHWo9KAjjE0H35onOv4Ji3jJWN241jaARlhGSn/2BBV4M8gzh0Q+xMyi6CBjqzNU82zVt1
	IjxkOZLfdkPAYOSRUuAyqQkeK0K6brA=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-HbBc3R8oMqqRblquhETiVA-1; Fri, 06 Nov 2026 20:00:29 -0500
X-MC-Unique: HbBc3R8oMqqRblquhETiVA-1
X-Mimecast-MFC-AGG-ID: HbBc3R8oMqqRblquhETiVA_1794013228
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f37c94ceeso41818385a.1
        for <dmaengine@vger.kernel.org>; Fri, 06 Nov 2026 17:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794013228; x=1794618028; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=16HUaCp2sq85hg8bU8Q79JWawMIdomwhEGR1N+tBFQs=;
        b=H1o1rsr/2mqMrxPsgD491WDG1WDzWaeymjA/zevZ0pM+5Z3soifg5kXw4qHmmF+FoU
         QKoDgO7IC2fMauxGX3VRulFpYCtvMsGND2wTDVUVIcHlrdhSyqWtYOhhItRJchITPpSx
         Lq5RvILUV7waSY/lFJ42/ANlhUYUOUPau7bNbg85LZLZINpKwjHwrKsB90NT2FUrTknb
         79pqRgsnUt0Yuwf6utDQSla4RgyfWvettSDu9DrwzPq8r8wjTSeJsFeQpZuJXmayQeU+
         7ec1mg5bnyXnX/zVrAdHhm/kaD1vFvs20D8V+1D/oDNG4Nk1cI7I3Z5sHXY1XE9UQZn8
         j+JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794013228; x=1794618028;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=16HUaCp2sq85hg8bU8Q79JWawMIdomwhEGR1N+tBFQs=;
        b=vzb/6xVuq0fezEjv6oXJsSaWlddtdRx6luTVyuKNF6f4TkbKYjsd/Bp2foPIwkN+/Z
         RNfEMLCYsiD52/NQGOiRVCP/pvcP7htGsuYPdxj0yes2n1YZyXGy4saJb4Cmv4Cw1gG/
         CroeXuNAXVg8bM5xT/KDygp0NQlWnntAaaENx66VXdfipGATlOhSG8sys5HDjheEkn0c
         gLUgTPGyHSTsnaOK8CaxOCIVYdAJaSa1udelQFVnrStnqZmPX8ew1O/GFf5wRg0UVIek
         YPDMM77p6MLIF+QM97+zW77S9I/A59AjMxZ331c6ruqe6LcJ6oWfPAAehmuU0iImfToN
         TNrg==
X-Forwarded-Encrypted: i=1; AKwUvBwe7iDlx26b1fPoYBPH88w3hpdTYSjPpVFIO6OUvDGOLWc0gZlKzSNkqDacsxmr0/kLJf7y5LSMzXk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+tC+GKHfW8uVELnqf8Rmj1bjBveEv3bCfIrZD4Ds3J5+BGCQK
	4dMkUDzZ836Tre4s10wQka+EflO1cTRMrNjgc588Aq+NyuFgGYGX2iIdOcHkceDY4mNek5yGkmH
	R2n7qx27hF5/rfb0tSrAZlkJuEO5WZyzGL7NtPubZG6+LPh3nkE+Dgaj+SZZ4Occais1HFu2rcI
	RkuS1/tRksuyRCRVdkWXqDfDws5VGGpQjjyDZu2Y6Qdr103MI=
X-Gm-Gg: AYBFou02YdSeWH4s1pyX1i8U5+8lRXKQ+umW+htaYayDgnLsd4RO6cHji1m1qzbZJA6
	T7+u0GyVL4hhbbIKGZJQru2B6WtwEgZ/yjsb1RkGGQ2WCmB2XEbAgtYos8OjAmagqA8CBMwzcOY
	y3LesnkLGqsIo61T4gMdv7I7Wi22wj5xjQqrGQGGHYvmyDrxfz3901jacqiLJbGhPLRECyPfl2s
	YCd+NctlC0/3YtDvwtSw7Zdx2Dso4HXTK2gvZ8g13zZux2Eiv65nNhnKD0HPHaelZxOVfvi3CQk
	jHFtCa+SxKxhmnTiHoRPogLyKNB4aqrOZDlgmwiMIcvbIAitCsEKcrAKE7GBYDJ0VnuwdtukkZT
	89XE5WS50vzPPxZ1pfSgqkiqBgcvUU4ZG4LlhBNCvF1UmA2WgLXC4qlcF9uGdiEiPIgotHShu4y
	EwN/D6Kxd+q0tNWJM8
X-Received: by 2002:a05:620a:258b:b0:944:4e6:85d8 with SMTP id af79cd13be357-94604b8bb36mr113028985a.5.1794013228371;
        Fri, 06 Nov 2026 17:00:28 -0800 (PST)
X-Received: by 2002:a05:620a:258b:b0:944:4e6:85d8 with SMTP id af79cd13be357-94604b8bb36mr113021485a.5.1794013227544;
        Fri, 06 Nov 2026 17:00:27 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945f5a97aa1sm258908585a.8.2026.11.06.17.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 17:00:27 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 06 Nov 2026 20:00:18 -0500
Subject: [PATCH] dmaengine: qcom: gpi: convert to subsys_platform_driver()
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
Message-Id: <20261106-dma-gpi-subsys-v1-1-b37dcb4ba3c4@redhat.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQwMz3ZTcRN30gkzd4tKk4spiXVNLk8TkZCPDZCPTJCWgpoKi1LTMCrC
 B0bEQPlBlVmpyCcgUpdpaAIShc+dyAAAA
X-Change-ID: 20261106-dma-gpi-subsys-594acc21c25b
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=1232; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=jmAzhr4h6GEVM+4TElleiQn0m9dCBbcSbMe6/5AUMZU=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLeVajvYHvCrcZnfVhup7ZbVD/jQymBBFPzLpMpT6rOT
 NCwenq6o5SFQYyLQVZMkWVJrlFBROoq23t3NFlg5rAygQxh4OIUgIksS2Fk2CdjtdZB7cIq7daS
 rSkXf0ju6Lrx+d2f5guVLB8/qCeXrGRk2G00j3+l2+FX5xUaTlVI/VNSZuI5/v9s5qyHDMpldzt
 2MgEA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Reduce boilerplate code in this driver and convert it over to use
the macro subsys_platform_driver().

Note that this driver is configured in the Kconfig to be a tristate,
the driver doesn't have suppress_bind_attrs set, and there is no __exit
function defined. This change will add an __exit function that
unregisters the platform driver.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/dma/qcom/gpi.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
index c41bfac65ddf..d6c76ce1846e 100644
--- a/drivers/dma/qcom/gpi.c
+++ b/drivers/dma/qcom/gpi.c
@@ -2325,11 +2325,7 @@ static struct platform_driver gpi_driver = {
 	},
 };
 
-static int __init gpi_init(void)
-{
-	return platform_driver_register(&gpi_driver);
-}
-subsys_initcall(gpi_init)
+subsys_platform_driver(gpi_driver);
 
 MODULE_DESCRIPTION("QCOM GPI DMA engine driver");
 MODULE_LICENSE("GPL v2");

---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
change-id: 20261106-dma-gpi-subsys-594acc21c25b

Best regards,
--  
Brian Masney <bmasney@redhat.com>

