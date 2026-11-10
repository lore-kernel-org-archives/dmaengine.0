Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794271378;
	b=m2ct3W98f+IYIOEw9MJfKb1yS064JEDrjzaXGNkzGY40j186JGrAgQUs5IQ1o9AIs/bF
	 IGtCNSU5EMjnYVHzpy/3Bk++S37cpAOyg5cF1G7Xfo2gVdob6w1jk2SGzQ5xq8U/fk5Ya
	 yNf6IgftPy+Aby2CaS2OXGRKKox2MjFEfKsrqL83r2iBUSZ+Jb3SLDHz+RSywuta0qGwL
	 RhLsb6LiEquUZEFQ9Edwb/EWGtJxzK37UhHluV0FeQshJuwMmSvbpC/sNSWa41fIlxFXz
	 qRPontIgsXZZtgU1TuKvI+bo3sLs6FpPuAVZaBYk1oNO2+64gCrjeVEZI8rhxDXYv/Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794271378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=QPGn/2cy7Zi3jVYB5TbulGSrRmUDAng3X7AvBZrHC8w=;
	b=1ApJZ11uPDaMJMah4NEHlb2XkTdbIk7l+fR9Hz8kC3/8E3Nl3fBxjQp/VfGaKUrY6VJO
	 TpJBxBk7J7o8QcY04rgzVUQdTTS0vtqiJrXecINmc0VEs9mJ5n4mIP3t+h1eM++QIK6kb
	 ru1T5knlWKljRzqMrs78gOw19fM0XHqPaqlyipvOOGgQRpG+Cgvsc247C7Z6k7qIpJkeR
	 /YkVY2339H1oMIeYobovMKm+tfdceuryVLcvb3AsyRC2eh1D+55lSm0pyz+2grIbCZ858
	 wgd6QiSDO3rEE6noNw//yKpH9bHBMuQv8sskShQwP/Dj9luVqsKNg4nh5lDYCNUi6QQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H35Z2wi0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60265606A31C
	for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 00:42:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60265606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H35Z2wi0
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b408f2d936so2228757a12.1
        for <dmaengine@vger.kernel.org>; Mon, 09 Nov 2026 16:42:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794271377; cv=none;
        d=google.com; s=arc-20260327;
        b=X6+MAD1qCm1oAK8UHkrr0gLfhHzy8ImJEiZceBzTtlKuM4eGgbZETqkFIx7MLaQGV3
         eor5M6tu4Mx67IQyipET26oR5vf/l+yGqGs1rA1Lssmo80ggeIJ133TObmlnRQVRt0fs
         TrSD8PvnDV2PZEuHQB9r1kZP83jGi1qBHPDd/25RRzCAK9AL+ezjbzm6bKMLlNUnRhSw
         zsiVWRw3QFRqnOLQcBmtTiXh+ottMwtkOBXfP6ouQQ/tYVIa2W5ziDz3MoCIiDFokO0b
         Thl8u42VGKSW3z5at8nlC5EMHdrMVn5hvVHY3SFVRbd9yR76y3U96ZIe/M5N4rNO4/LX
         KZ/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=QPGn/2cy7Zi3jVYB5TbulGSrRmUDAng3X7AvBZrHC8w=;
        fh=x0XjpKXLiwsDte1noUtKnQDnaR1KA6yGk/dKPGTQBZw=;
        b=H0UIsSK2mpHlnG3anXv7H+d+z8WbOAIBfyPljxIOlhOFpHZuIBBICCYvIleBvlpPnJ
         fpfEHA2OVf4mZC38ArGwn5VT/x7YDNcG3vwdU8jPbF4YB4Kr7JHxIJJq7HjPsZlUVi2v
         CSt5APW43Gb61sPvejBsaI9Vw2xesR93JITGTGDyqFfWegEIn5W7Scyyxo2tSvDaehq/
         iK8Tt2K3XHEz310c4Ml3lDTzM7w0I80V3DwvhGSYhLhTEWx3X0XngA1awdy4oNuhJ4jP
         LOOgfn2dbIW3Zb/vA3nY1nIf6VhE3B/Bc9rQVsMm/NKpGwLzII9U2VpL6Zuc14xmt4K/
         p9IQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794271377; x=1794876177; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QPGn/2cy7Zi3jVYB5TbulGSrRmUDAng3X7AvBZrHC8w=;
        b=H35Z2wi0GAXSSTwQzZyXKJggQcNY/VUbsoffPcdsQH1+oW7XAU/kNN9vpOzQl6G60T
         En4AUb2eEP0yjc3Db/aar/j7NdtlOGly2UDVGmgvWYT0SBTIiyd0FUU9nTv8pcJl5shN
         h+0ZsSQBpOflLhDo2wrgLhz0p8HwSS+0i6kh4N5zY5qc458AIQHFX9zk/gJdAYL/9Ouz
         A6UNQq/V1dr+fcXADCRz9cCKLVH+wigmwqjJbj/mQq83j1wM7edAD6PTbda4R7fPbxkR
         6GqTNTiZI0Mk+mxY8N0P1W2Oq6AT4ErggHRYN5IBTvr4PJ912WGiiSeFejeFNHTb3isU
         r8pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794271377; x=1794876177;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QPGn/2cy7Zi3jVYB5TbulGSrRmUDAng3X7AvBZrHC8w=;
        b=tVrBxiJRaPqc8bvqGd/d4Ipf3jG6LlpZ8ko2R2NQfecVn3d+GGYaok4m9pBUp7/Sfe
         8BOOOUVVsTcsMGZNS/8H1LxGYWlzwHCEcmm6F8u65cydOk3drLvYuEuT91SX2S+a6cuY
         EoMHZJc3dlgcPqrLnHAywAxT09yxqgJ6cJdNT/LYGqH1e0k+7ZEjwHbKziacxH8QKjY2
         dWIGh9a7KPu7WzomM9GqWlXx8OBdEI2YA5ikmNRlSlygq2eNkhE2yKSv2qWhTIz20WmE
         SXdPELGRNXr4ytvOjsCHZ+d9cfnk0/zmhshuKljsl0fwec5JU9sZm5Ba5vgWn1TQzCsj
         XaFA==
X-Forwarded-Encrypted: i=1; AL+hErG6wyq51g89w829rEvHArHYADmbfkR6bu6BSKMKauN/VSU18VG2o5byqMQSu8w+5t6VxxDy+t0Tzao=@vger.kernel.org
X-Gm-Message-State: APuU4Z8W4tJELMHetNUlxNQfOQXARHArbzWIxLrNCtOXdRMagKiEiEn3
	Hv35CZASfJmN9PcIpp9PEKovDjVhzK4m5WWerzDagqMCUNtwlUZCgW2wjaAMPBSd7DdyH3M70KB
	IU61ZTm1iqPgG/2+E4mT9v8yYIhUmjvVv
X-Gm-Gg: AYBFou2R3rGLexV6GCWJhFhvqdMDitPbaex/NWFwN6DeTggfTUuFNOBDckFj5INj0L9
	oupy/cRmA65Zon5FY3PBn/togiGiYMlR/GVgRwDat4Ta6TT+shPbW/zB7l7Hljrfk4idAcs16vr
	ivk50DxGOuRqs8UuisjEEyCKyKHj44JNFYBpAoQEoKeh67Vh/3xXlqLkqApGgqIaClv2TAbTdkH
	JaLHOv5IgywnYXQ+LD+/jBuqeHeJPrcMN+fH9x3cklWAjR4D43EC7aNsqsD67NXJe6qBYPKQ8/k
	veebc1yxc2Jx07GrjgaCJMlWvt3/SEKwWgW3DV/NdsWFu18F/opZlK6At7chIwgxbijLgX9zTza
	WXnmOh7Vjbw7riZ4Of579QCrfpqu55SMZtCiLoSk9q/v3W1aCILzdM2JwIW81pwRS5zZj7FIddl
	n6EtYLl/AO2iGimQqahK6Z20AbdNeWBOiQAb/t78S3kAUr
X-Received: by 2002:a17:906:c112:b0:c46:cc9e:a14d with SMTP id
 a640c23a62f3a-c50496b04demr61764366b.49.1794271376660; Mon, 09 Nov 2026
 16:42:56 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 10 Nov 2026 00:42:55 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: mhun512@gmail.com
Date: Tue, 10 Nov 2026 00:42:55 +0000
X-Gm-Features: AclHuK_Nbr-5sULo1t7fMr0l5xY8-e0EITNYi6BiM4aUVU01eCDOgyeriNaujDc
Message-ID: <CAGEsz8ENCW++SA9cdh5=2EVmto=2-2axzTwuNhaKv+xW02Vvtg@mail.gmail.com>
Subject: [PATCH v2 0/2] dmaengine: stm32-dma3: fix provider and clock teardown
To: amelie.delaunay@foss.st.com, vkoul@kernel.org, dmaengine@vger.kernel.org
Cc: Frank.Li@kernel.org, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	ae878000@gmail.com
Content-Type: text/plain; charset="UTF-8"

Split OF provider teardown from the managed clock cleanup requested in the
review of the original patch. Patch 1 unregisters the provider on removal;
patch 2 returns the active clock reference after managed DMA/IRQ teardown.

Keep the existing remove-time runtime PM disable barrier. Check initial PM
activation failure, and let devres handle later probe failures. Remove the
manual IRQ-free loop from the original submission.

No hardware runtime testing.
