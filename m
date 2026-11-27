Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=101.71.155.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779217;
	b=OwCBQf6db+WniLySZmgHcTfWMGkrhZdD7UWmQhQUR9inevgL/7BBdI0aOhLglBIGhj4d
	 V8iRa0NSdwfjpC7yKEpv1+s3VFABCg/CtVuwR7uKNYySOINc/iIFRoAabffb6VaQx3yqE
	 2ELlLot9phFM0WWBOu69YxPXPPqylH3Pf67B0IGRsJsyM9hCGKvZpxaD45GvUJ0NM/2In
	 1Y1UgeSA2vW9o9nuoFD4NLpxAo9NPqEInRvztGox2qO+O0cQ6Xin6WaPPTJ9u/d835OLd
	 cAQYDtrMl69BaK99E+WDpqjD5VwwGKyLCAU1Q/a+2CLCXqPe4fIV0Iv2repHdRSZcIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779217;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=oNHqfl9+bibmQEueGqHatMhjdg5hoX83BhY/GM2pZFg=;
	b=CzateEAuV9MQ5KWujhKTf4B5uUuUA8YcL4SAYRK3zKqRTCpOdE9U8SGNRouyKTM0KXph
	 R+YzcC07jZYgCrQltA6TsQHUj0tdGA38ZufPEJ/jXcV8RzxqD7opkcSBaL9k2wXv/c44h
	 HQJWAjf1Y2qj3f9f/pMM+8kCUfHAMElLqVMKOtxBtl2IrzfbNgu9PL3yu1MaZe6pxJUIP
	 34G5MNeS+XWnHrfCHLmei6vJZ8NkOepU5ShlL4lac708p/aErocwK6b4rRpESwP6Cj3kI
	 PcTz+Nfzsg0VGME0aesxurDAqbaNX4Q9RhJ7+MZ9iG54oJ9app2gUU6wC+QQvmK7uxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=bT1Xmvbf;
	arc=none smtp.remote-ip=101.71.155.101
Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD5B606A31C
	for <dmaengine@vger.kernel.org>; Fri, 27 Nov 2026 11:33:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACD5B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=bT1Xmvbf
Received: from user.localdomain (unknown [223.80.110.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 564299833;
	Fri, 27 Nov 2026 19:33:33 +0800 (GMT+08:00)
From: Tian Xuechen <202300460064@mail.sdu.edu.cn>
To: amelie.delaunay@foss.st.com,
	vkoul@kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	cedric.madianga@gmail.com,
	pierre-yves.mordret@st.com
Cc: Frank.Li@kernel.org,
	dmaengine@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/3] dmaengine: stm32: Pair DMA provider registration with cleanup
Date: Fri, 27 Nov 2026 19:33:29 +0800
Message-Id: <20261127113332.390552-1-202300460064@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.34.1
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
X-HM-Tid: 0aa21cc838b903a2kunm85c9bc3d395df8
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaGB1JVkpJTk8YQkpKSU9OGVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVQ0tVSkpLVUpLSllXWRYaDxIVHRRZQVlLVUtVS1VLWQ
	Y+
DKIM-Signature: a=rsa-sha256;
	b=bT1XmvbfQTvdpviiigCrR55Dgo1EZtbECMxnS9ukfh+r3kEfnfD1jE5nKHk9aPj5oGSJuKzX4TPAOXiHWimD0oHIO/gVnVZYI6m1Akf7eowDW/TQKo30p8xk0rN9lXpk/iaIbGEpKdcOcPsgGKGdoVGA530A/+2rzfWttQSjor0=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=oNHqfl9+bibmQEueGqHatMhjdg5hoX83BhY/GM2pZFg=;
	h=date:mime-version:subject:message-id:from;

From: Tian Xuechen <202300460064@mail.sdu.edu.cn>

Unregister the STM32 DMA mux, DMA and MDMA providers when their devices
are removed.

Tian Xuechen (3):
  dmaengine: stm32-dmamux: Unregister the DMA router on removal
  dmaengine: stm32-dma: Unregister the OF controller and DMA device
  dmaengine: stm32-mdma: Use managed OF DMA controller registration

base-commit: 4dce97c6c265544342e716e62fd24bbb232590c5
