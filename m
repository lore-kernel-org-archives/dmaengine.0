Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3BF47DD6E
	for <dmaengine@vger.kernel.org>; Fri, 18 Sep 2026 17:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789754396; cv=none; b=M0xBrN2c9hrV1jNDeV2ZRFUco7VCG7JovfG1SbFRRoeaGiWGBOnB14rpxQpqAODzlP0ndnm+ErFWuIeyn7X07A0mqfdKEJEotucZA7ZR47EKCTfpcZ8RiYhKk5hW8lcSA+kw5mVTuWiBHRdsidsnkrWFiVMMyxFYyzssgwczNgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789754396; c=relaxed/simple;
	bh=T8+9GlGP9MFqBMqKA24QJwMA5/YrBixZGvj9RwPp7mg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SKs9/vFmsMKbMPSBPNF30Md91ecshhQVcdbYm4IAIuIiDcWHsgob879dvxar/ygfQsCNTHxkgxBb/YzCfkTL5OF1GyQoR3khsuA3Bc1fmmqWsjI6NqoAhzzMV8nteLO/Z90y2tXqJtDFRd7k0eJ8vM5QPmCXGDs6pDVJ5VqO8uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bmZ3pBAC; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bmZ3pBAC"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4c08393b0so884245a12.0
        for <dmaengine@vger.kernel.org>; Fri, 18 Sep 2026 10:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789754393; x=1790359193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3+paugbOt45TmuWzryTTwPeNc9ZdcNY2MsSqwjEw8MA=;
        b=bmZ3pBACq8j/dnlRAOnFU3KUNdn3tLu3ShCv4NY5qnW53bF5WsLSUkUw/jRwwDYD5r
         fU6p/zpnsilK5nQ89lGEtpyoQBoN6PGCOG2SAT0TNCeWZMnYIowkZYHhR50VyZrlTL3A
         NgpX77muCkBwf8MAbzqmG34DMrXvCy/50uv4Olglgoa7e2OpaLsa6dIPVY9ocH4jz5nB
         CM38JjP7DYsQ/YAlooko0j3OYQ8W7eXX+rHDYWnUnYRl4/1ynT9/i88zAcD9qTEEPLB7
         7P5LAOpWbPQep+aGvOECkIFRRqdNDFpnFqbxwbwf0tugAsQ+7l9anqkD1XzhlH3BP57E
         aW3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789754393; x=1790359193;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3+paugbOt45TmuWzryTTwPeNc9ZdcNY2MsSqwjEw8MA=;
        b=epJUajdr90v+8rHHQBVZjGx96mjDV3x/TPxVtJp6ORpW+F8kI6OtNsTjI0yVvm/33Z
         EPIqgfNhd//CHFnWoQcckAois90jrJ9KER6fiw09dBRb344c9deUkEdLV40nRQp50t0F
         woF2i8PFAgl+rTHldM6kbx9WQpx/dAf/muFCj89iUQBoGdOECeuwoErkHt/uYJ6HfGcC
         sYFBvDbFzfsmjiD/PQTJkAXN3EJe8FYvdBsOIhbUcz6ccV4Nn4mPYOWcmbEztxreBKSM
         hzh6uVB6rxgq0efiR55+BHMakSADeWMrpFHpRkcjBcMkuKOOSGFgKmPUoVm5DBSjxFLE
         ZCzw==
X-Gm-Message-State: AFuF++mobUEywJiDPwth1qsKs7pCbg+ti3O+aBvrfnDOzkWhhOVZ3Wnm
	AEoERIwB+ybKC2gg58kmcZBZFW+brWdEBut6GfDv4QXOM5MYbjYkSffwKDfMww==
X-Gm-Gg: AYBFou2hpd0jw67UBEh+3cgXLv10+AtOBXEp/MoHEtytU/9sREYfRth0l5b7xCNJ/rl
	vxxiVyBX/Kq3ojywnOnUtxWSJJAJro5x5qLqbeSkCvdEWcjixQKKEa3/d+hnNmOT9NiRuWd9AoX
	BMX5lIpKY8ekszGKe4OZEvxJ6MWz0dqTo3uIur07SGLSiEW3u2VqoQOGaGoSelrXUe2NBsj5yrr
	zX5XsV9VzOvYqnIVGuAixLBi1NwJd4ccDwq9wytTlCrxv8+Q7NCUw939gfP5aAf+EJyzSukDM/O
	V9aSCxbahU6TFEkA8UUzWV3yFwuc4QIBWZ9EfnaYnuMLzDu7hFn1TwBnwYlphXGow5JrovxLiLh
	Qe2iNs2ezURirtEIeW47Ume/BkP7wUgGjNitIH+DHaAkNZlCEviQiKK3MZu+hluu24IuCUWhjGc
	WLkxGF07n6+XtZ5SSUh3PTWNxbahIntN4K7g2ZnINDJC5z/1JIi2FWhiZO6db4tBySZY+6Q7c3s
	Q83lEw8CsF5584EpzW7R1B7lMPi9cvmU7MAJnTCh3lK72rg7WkOFbI5lMBM9Si7SBhjLBcM30qC
	ihlxmMkCMhJq+YylJ3nQbaN78CIV0RggElryM7wOOeS8R6gw
X-Received: by 2002:a17:90b:3b85:b0:39e:6c69:34dc with SMTP id 98e67ed59e1d1-39e6c6936b2mr506482a91.64.1789754392938;
        Fri, 18 Sep 2026 10:59:52 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55bf843sm304342c88.8.2026.09.18.10.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 10:59:52 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] dmaengine: bestcomm: Enable compile testing
Date: Fri, 18 Sep 2026 10:59:50 -0700
Message-ID: <20260918175950.21657-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow the BestComm DMA engine to be selected for PowerPC
compile-test builds.

The freescale ethernet and sound drivers now need a dependency on
PPC_MPC52xx as they use headers/functions from that platform.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: keep it bestcomm only
 drivers/dma/bestcomm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion1(-)

diff --git a/drivers/dma/bestcomm/Kconfig b/drivers/dma/bestcomm/Kconfig
index 5dd437295964..153b5492c93c 100644
--- a/drivers/dma/bestcomm/Kconfig
+++ b/drivers/dma/bestcomm/Kconfig
@@ -5,7 +5,7 @@
 
 config PPC_BESTCOMM
 	tristate "Bestcomm DMA engine support"
-	depends on PPC_MPC52xx
+	depends on PPC_MPC52xx || (PPC && COMPILE_TEST)
 	default n
 	select PPC_LIB_RHEAP
 	help
-- 
2.55.0

