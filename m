Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795171083;
	b=Dv1u8F0768qzO4hPfk8LJgXCDp38hC9PcepXZfGZFnybH00XwTZnE/FaZMSJuSY7ZRv0
	 097CZcxAy9LprznVtiD1NAlBsl0SOY0WRQYpB0Wv/Fi+anmlqv1Eh4bhhXNaUNEevbOzi
	 HakQrem7GHKRXh7JtAMn+SAzFkYZenQrbgxFvRsHZCXOJ/LUC5s0dybYQCPzTB3u/57YW
	 zmffrXGTc9/cOjV0yXTWYalPueX5RHtnla36usYH5dv/i+Kj5Omkz8/m66N0CvhKsdPNn
	 nTik5Zp1/+6cnK2yZdy8HC/Q5WIu4lt28Cew/XXQrh4nld4HRRJWKz/521bUOuaEWjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795171083;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tukFCQ+V59hFAVr2BrPF0eFqsF6upzRbKksfR9edfnU=;
	b=cG591q7gBZL13YiujfxvucA6OGNdxVQIZOtB2k8ZjNLJshRhj916aQwBLhbyvfvKkHBR
	 6Yw96YqNRICkSufcZsBzPJ98qzinr7mhrddPvMpJJZ1s3BykMRfHRNq+MUpsA7mOqytWQ
	 rvKT2p5yPLTdX0RwsjiaaHyCHV9FsN89vlr/bRDvaP480WbG3H/7+Nj8y6MLlH/T8kjEc
	 c8T5I/dOqObBWYQvSK0fpPh7O8jnvs9C2XT0/DX7wadmdHObWkjZsbTdyJxhfzaq/30Es
	 0LEeyF9hS1k2pDR1DtU+B840EIyvdjwjJd3mBfhCzpakBmrzV0n6shm9BN2v8fD5Wqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T+Igg2Ib;
	arc=none smtp.remote-ip=74.125.229.139
Received: from mail-dl2-f11.google.com (mail-dl2-f11.google.com [74.125.229.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75737606A325
	for <dmaengine@vger.kernel.org>; Fri, 20 Nov 2026 10:38:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75737606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T+Igg2Ib
Received: by mail-dl2-f11.google.com with SMTP id a92af1059eb24-1b345449fcbso35492c88.1
        for <dmaengine@vger.kernel.org>; Fri, 20 Nov 2026 02:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795171082; x=1795775882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tukFCQ+V59hFAVr2BrPF0eFqsF6upzRbKksfR9edfnU=;
        b=T+Igg2IbHSXbk3lUJ3V7ipg4dr2b5O7bN74Mb7eoJ2RwD+IFN4q++noFuV/aBDbbk+
         wrR91TFXQuk9t/ZR5OcttYIIZP2iNUlFqwzRJS8cyEmGQd+Toz5FJgNllcei/BI3T1r6
         JuVE4A2kVAFcdSeDPoimS1OVOCqe6MSlkDXB/Aelb0zStu4lK+ZckOSLM/3eXe6nNZRs
         zTBTX9qfRMZ2VYPwgasXqBdT+f5ydRoQQ1l3vAxUAzg9e2pwi+rZW+tqIBujrgi1a/v+
         Dpimv1Ic0DFUbO0ij24mK5miKyTtw3pGWj85fUtbOxTWRIFiWFxPu3L+gAYHV2zZ78Y3
         gtmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795171082; x=1795775882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tukFCQ+V59hFAVr2BrPF0eFqsF6upzRbKksfR9edfnU=;
        b=wvibNucknDp+qO65TYZgc6Z5INZWoBYyrbXPkV9ejfDLlxBaO0E/jhsHexyEEhqWCf
         T0jHQs3ZTVj45rt9DGa4xbk9fxSzfqglTFwgOa0MTmruMDO2j1ALgrSFmZlqp80DAkh+
         huk/pHcXUHOJfNcwGP7HOLxVenJfAI+am3Lut9niIhmCJ/wXVTFeo4TcyfdKh7OSqOK9
         AggYe1lawu+Vv4GCqH8ZK2iI//He6TIdaB9NmsfNCGTR4C6BVKbYQ2FIRp+qlfWiVN/9
         BFfYafZ+Oxfeyya4HGtHF2kf8O20cP4muNtFGODCP7nh7GYAkmipi4fbL7zoUG5Gl2BF
         MdVA==
X-Forwarded-Encrypted: i=1; AL+hErGDS0LhbnVI7tI4byuGgLZNeRUHaQA/wHD8TzQaBxM0liv+z7DHBTGEZNMTUyZmin+8q+IN8MBK89U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uUu+1yQf+I1M/0h3onJUEek0BM9ASV9WRJWLp/k9JXuQTemkg
	TJJ9+xKXF0S3tJ1cXZlrk/j5vQ9JFBgXEVy2Ed4msb1hUqTwlu2sGp02
X-Gm-Gg: AYBFou3hJ+XlfAeAmC2x7+GVUoEI2JMgM4KxYWHow9Vv6ZOvVtUeV3A61jlLiUNlFG5
	AnJ8AFD+JU21jSEGITAB7CsooPdrBezKk1OelqZkbsCYRTLINpCdd3Ft4JbfhSP/fhcIAMPDpz8
	14fV0NDB+JXh7vrq0B7smZO2160+qiMoSeU+N7kd5ZmX1lgfR+btcDEWuqMFpjNSK6zCnoPeMqm
	trwJtoqxKHKfxiE/zSplDc67Y8LMp4bGXgzffDMegHgY5jkpPIeD4fk1FK3bqlxtcS18u4e/UbJ
	Ju6Wy0gzDchgwTSu6hvvbmQwij6irKvuPDbnK30pJF4J78bESwgN7q3WA/JtIEyUuVbzBfR49CV
	VXWKtRykE9lkwvHswuFY1ICELsuwCcenrhc2Hu0trZKnSYBjlRSgYn0GpLBCClmhNuo+BBfNN4X
	/o1oa2nxWj8OGp+Bg+Rc163kI2+sXh1rUE47gNPvMDmZbndnLlh5Z6ngPdGv2ZsCmNtNwlBNpyS
	4ImqtyRhMWpZFUepQ1lgP/Qn36RhLMZboAl4JqWUzMc5Bn1DHPTnBuluaq89o/DqdyPUMpZ/qP9
	JguCLX9GAikLRVbdV12/WEcsS5+pHr2lqj6Xt5DnyRdsRVGkBEIqVxrtJOYRw39V7jMhBrMtjdJ
	MbYvVWEOpLDeM/5FzXa2s4vE/Y2nrOMlk9xv00A==
X-Received: by 2002:a05:701a:cccb:20b0:1b2:3448:840f with SMTP id a92af1059eb24-1b55686ffd7mr2284653c88.7.1795171082505;
        Fri, 20 Nov 2026 02:38:02 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556831d45sm8924731c88.11.2026.11.20.02.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:38:02 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: okaya@kernel.org,
	vkoul@kernel.org
Cc: Frank.Li@kernel.org,
	andy.shevchenko@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v2] dmaengine: qcom: hidma: avoid world-writable channel sysfs files
Date: Fri, 20 Nov 2026 10:37:53 +0000
Message-ID: <20261120103753.56194-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
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

hidma_mgmt_init_sys() creates the per-channel priority and weight
attributes with S_IRUGO | S_IWUGO, so any local user can write them.
A write stores the new value and calls hidma_mgmt_setup(), which
programs it into the channel's QoS register.

Attributes declared with __ATTR() are checked at build time by
VERIFY_OCTAL_PERMISSIONS(), which rejects world-writable modes. These
two are created at runtime with a mode passed to
create_sysfs_entry_channel(), so the check does not reach them.

Make them writable by the owner only, the 0644 that __ATTR_RW() uses.

Fixes: 7f8f209fd6e0 ("dmaengine: add Qualcomm Technologies HIDMA management driver")
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Cc: stable@vger.kernel.org
---
v2: Collect Reviewed-by tag; no code change.
v1: https://lore.kernel.org/all/20261107221500.96825-1-dennylin0707@gmail.com/

 drivers/dma/qcom/hidma_mgmt_sys.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/qcom/hidma_mgmt_sys.c b/drivers/dma/qcom/hidma_mgmt_sys.c
index 9672ef9ee8fc..53b991752e80 100644
--- a/drivers/dma/qcom/hidma_mgmt_sys.c
+++ b/drivers/dma/qcom/hidma_mgmt_sys.c
@@ -265,13 +265,13 @@ int hidma_mgmt_init_sys(struct hidma_mgmt_dev *mdev)
 	/* populate parameters that are per channel */
 	for (i = 0; i < mdev->dma_channels; i++) {
 		rc = create_sysfs_entry_channel(mdev, "priority",
-						(S_IRUGO | S_IWUGO), i,
+						0644, i,
 						mdev->chroots[i]);
 		if (rc)
 			return rc;
 
 		rc = create_sysfs_entry_channel(mdev, "weight",
-						(S_IRUGO | S_IWUGO), i,
+						0644, i,
 						mdev->chroots[i]);
 		if (rc)
 			return rc;
-- 
2.43.0
