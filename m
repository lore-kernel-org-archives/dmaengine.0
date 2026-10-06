Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDE43F107D
	for <dmaengine@vger.kernel.org>; Tue,  6 Oct 2026 08:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791276430; cv=none; b=ezrVY2uLXTnNXo2qnj2MyQ2RQGx9spuwOKmpAmFhcy7E6VrFaOKbIjyabvME7OX28EOwVTMQViPsvUkIMk1GwgTr2q/bMucHYdCKjXiBLor/RzgktZyAcg6NeUxOU5wxU7XT9gpHq4O1epopPcV8z1U7aFmTWL5haKQtaDVxGHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791276430; c=relaxed/simple;
	bh=Y5I/CL1DWi/QmLGmTujVQuDA4qOWChsyqtJ54JZGcwk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fXc0Ej4t9zyxnOIN1QLjI26/6t+yTgeNj+hGT9lf8bkBh+arO3oTMVkW6F1ldRRNaJ+FlR8XyFKJGi556kMZ6U+3ukYknoncJdp03RC+Q5PETY+bjbT94edeWhAG+XjX4Dd42oSOXO6ggpB9uljuwNz+af39A7aT55LnxIWlnoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oG79txoC; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oG79txoC"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-15dd124bbe7so416983c88.1
        for <dmaengine@vger.kernel.org>; Tue, 06 Oct 2026 01:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791276427; x=1791881227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WhUQkB5ApWubW83wi3NSnOcuN7HDiWQBERp7rOqWnYc=;
        b=oG79txoCf7Sza+JWT2OIrYi/Cltd6FgYjpBOhQRdBNKdA92XhNIWpf7HlwE1QCXdB4
         z36QPMmZeH5CxAvwnDBwhEIoNl35Kv1/cPRYidIOdwhrV0lt5gBDANdfCwYa3nLQo1NO
         OWVHdZf1v1kcJbqgvZF9hsv9sheHJb9ahc8+7KyYbqtxwQY7MZX0c8saT33eDox+WaqC
         SeIAmZ9Gh29ILUNupxT8RA/h/ZEX1icQjR32lJ7LXIN4g6o5LhzgKOKhvrCcl2Kk/2Ob
         6y9XWZSfiuaxDPY1/BNOihyRys1AZuCkP9jCZwSvCyzFT78JCaPUMS1hzEntg4hHRT6q
         je9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791276427; x=1791881227;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WhUQkB5ApWubW83wi3NSnOcuN7HDiWQBERp7rOqWnYc=;
        b=unq6L9+0e0lth9G4r0lDd83DsXFzQ0hNyBpY14op+VPNctxQU+kupf+N+FubVqfRmM
         QeHYn5VOouCA0IBY/MrpPVDJ46wy2tvKrXS7wcgQhKinmi55eclDr28Y+i9VOCCIZEcS
         DiPIAKuZvcfpNW0De9LwQSYOVCURFQS19AnJ36lMSFbv56HX/yvo2Xtq5V71M7JeUEhD
         dzpvudZ4C/Z3SWLRqATW7AGuHTRsn2T/1oO1qPZjSjxIGzbv9qB1FCyBCOV74Lb9Qhkj
         JcKGoCPjnUVw0zsSWwT7veBt3q/giHkytvzFhuFBJ/xeK2R3FZQJgsnWuiuWCVxxeMHZ
         /Isg==
X-Forwarded-Encrypted: i=1; AKwUvBwVPc+BsqpcOlxnwvazV4sjT769pYLPqAOgqMX2DSp1UuDiu0hnYTZr2yush3tdnWgqBwiFxLgEHdE=@vger.kernel.org
X-Gm-Message-State: AFuF++mEuhD4joYVpLdvFQekV3WmRH+3xmk/ynTsx3tszl4AxRaw/ett
	wR5mdFMfzoDYaWUIjFxAy0pXI8ytuJS0jvdro9L1qMkKeX3WFJV36UcE
X-Gm-Gg: AYBFou3mAdPNgT+7bdipu1AYe6KPMWybZo/H+0/JAPu0fMabiA8frU8gOijknqgyKBO
	g9k9cmYlMdKa7KC7zCNtNmoO4DK6lFpkR6LSELbluPhXOnQcYT3D2V7V5XX6jMndlSrpzMu9VUJ
	LgBuTqy3CPxEsW8dunZ3D4730g4IA6KUZZY5JC0vSYPkpBvQs1AZbI4RXOAbge6uWC2ge/gIIFq
	8Iv1QgVA5sBHNeRKmJMgjutRQoXux/q6K/fAs0eheaWz+6YObK1ES6fT7aH2Zk7wPm8NVtKCouo
	ZlCAqNjMmtmkJD0jIq5ubEBzJ31VCv1U4PZM5srlEcKiXRFj/M1MODr8vSCBmj6Ovm+toyfZNY7
	fYmKSX3rtAa5cvlfwtSIhYQaI22Yb5eC9rxLJggo2GUw6o8gzmpqQtoGK4w+G4p06xvYjMCCZIA
	nkb5pU1DC1Pm/ieO7ESAZ3lYal0GXrzAu1PGNaJ9URCJPZ5WQCwB6kKuB5nfKtEsXmOoH+jzYaC
	p5GksnfF8Ll9nGFmfnWBXA=
X-Received: by 2002:a05:701b:4588:20b0:147:9ad0:cf10 with SMTP id a92af1059eb24-15ece6d2ce6mr1097108c88.47.1791276427314;
        Tue, 06 Oct 2026 01:47:07 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-15d83d6ac9esm6966415c88.11.2026.10.06.01.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 01:47:06 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dmaengine: ppc4xx: fix typo "contoller" in comment
Date: Tue,  6 Oct 2026 14:17:02 +0530
Message-ID: <20261006084702.5748-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The comment above XOR_ENGINES_NUM is missing an "r" in "controller".

Link: https://lore.kernel.org/all/asSzFW-ZJ16xhFnA@parshuram/
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
Split out of "dmaengine: fix typos in comments" as you asked.  The rest
of that patch was the "upto" change and is dropped.

 drivers/dma/ppc4xx/xor.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/ppc4xx/xor.h b/drivers/dma/ppc4xx/xor.h
index da1230df2817..0931e18cd0d3 100644
--- a/drivers/dma/ppc4xx/xor.h
+++ b/drivers/dma/ppc4xx/xor.h
@@ -12,7 +12,7 @@
 
 #include <linux/types.h>
 
-/* Number of XOR engines available on the contoller */
+/* Number of XOR engines available on the controller */
 #define XOR_ENGINES_NUM		1
 
 /* Number of operands supported in the h/w */
-- 
2.47.3

