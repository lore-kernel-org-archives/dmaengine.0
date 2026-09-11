Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3AC2D47F1
	for <dmaengine@vger.kernel.org>; Fri, 11 Sep 2026 22:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789167540; cv=none; b=RmufcdxbMcr1rQryGeOHFVuXs/kP47SB23C/0Z+SCnP389PUE1dtaYWFzOqEdVqoBVw2Qb78Lp5jOYIIvvmfg70MpR0m6n1COCI8Uqrni3+5X0Oiim2mLhxyjmvSPwEJALGg1jiW/k+2luZRbB5GUgSWoNXinzolFrOyM1vbgp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789167540; c=relaxed/simple;
	bh=7gtPvIGVRGX7H9NK9fWacujtcKXno+BRlmXcuNSGxas=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tF1LgOvzmWF3q+qqtYEIyqHFpvvwBLG6ZUmzpxEK3Wbl+u5UVTgzJTLP9DVOq/AtHm60yL48z1LigHWQSd97NPM7g+VPUFD1EXfoQjZOfQ9ygGJXrSXv4+V/cWiKPpkLF6BLvT3Nj4ejqgzZQDzlhURDhSPGUnavMMFsI2G7f98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oGx5MZOx; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oGx5MZOx"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48583cc7ab1so139393f8f.2
        for <dmaengine@vger.kernel.org>; Fri, 11 Sep 2026 15:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789167538; x=1789772338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lo/atJ4TlAjfKpAQ23edpHxprTJz0JkYumYCWZqubbw=;
        b=oGx5MZOxDK7y6mR9wtC0wd6E2QFDydmvfhNx11Xp/wuQlHlQXbig+BYeKa8ljmY8cW
         EDfFhu/ACC/Fm/0XUKt0HK6KH2l8FZHmFD5aTqDlA9sdG2jEQ8XnjWNvwGftDX4GDtRh
         PAOYoxiCRJm2tVvwBQ1pL8/C5LRP1Yu1o0z6R5cyNNUO5q1UEvwKdSVY2834RGxDuurF
         RqO1ORXYtrJkVJYUSsXJx0uxb5KHCXxkQu5mzuGUn1rwPJFEuBxNAjwJOJnQCOuY/ii8
         akwKlb4feyKTAYpixU0OrzYwM91G5eHlpdZByoCh9O8WYUsY+B9rmuW2EAOn+NioA3gm
         w7GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789167538; x=1789772338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lo/atJ4TlAjfKpAQ23edpHxprTJz0JkYumYCWZqubbw=;
        b=R2u9QXxUcGCoIzzSurTv830IrRGVbm9KmL4UMHv5RyR7stf3NCztw06pcuLniGP/yo
         eWzi8rVjvistWcXx9JQ/PqeV53rlviIjnGGtchzoR5d1ySe7DOQBjg3BBJSChyLHjd+J
         OJWm88pnT8IZwyhk5Ks8P2oLwiyfh7Rgq8PepWJ6uNckhg7k3coKhxeBLUIBnhd90mw7
         Oc4aDDUKRowojQFRm/wimlTjGlDoKaK6dnqYV/76K1OBtgwtCuxWF0BsXVTZo0r7HzGl
         zBBDL5rq5LxBmx/XO8OQ1kZPRYDNKRzJFzejjfxVApvWUYq5/UByzMUFSZ4YlBnz9/i3
         +x0A==
X-Forwarded-Encrypted: i=1; AKwUvBwvQ0gAkSrLM6JtA13WB5X1h3fZ+JDH3xGvbgWbh7WB7/wW0u/YXUWa/xgFVyffB08lsTbrFEgSscc=@vger.kernel.org
X-Gm-Message-State: AFuF++khDWtIG8N/mr+nnqCxsDzfhWBa0x/GkhaxtYN5aPFs0rlh0w6k
	nPhxm8DO4ChQwkKR1L/qlyzObHRbPAk1dgrdPT+xq83xJmNIWh5+W4kv
X-Gm-Gg: AYBFou3rppMqbBFPl4G9/nq6HLXL+X4p2ouc364/8NeGev/gWeXhDWTt7JcmB78ke+t
	rYnynFOgCCc4L/Oo+7IA1cOUodDAaSr4zNZHGEMnXyAUMy5XBYXzlgeVSh2jecQQCCTwIT722Ka
	cQXgnH/nAUEUx03OBIXl90c86a0CxOggD1UWV/9Ugywol4eYMaC4mQ6q/7QRe4L+Dr5h12TV9HJ
	gt9SYS+aZwu3YqQGtWT9RfufItkdO4xy6I9hP7L2wWnzMdw9ywlr0N7kVW4PabKlcnF1NswxOEk
	buTsOuBgLTERtGWG6O23lXokhoiaW0T2oJwI6KhuCu8CaVew5UBrViBBne0EQLYkqpal5+lXjGt
	r6ad09Zj9bUACdHJgx9gCpZ/SdOhAYo1a2Ao6WsZIndpDcDO6ncZ5+Lycgdqj4Fycfm8gy5UJL8
	taOcreDH91YKbEagu4S7QbrjfMTBbLgjs/5fhbeSck1k0mWrDKex0UDKpxsIwlPNKxBL9ipTl9v
	WG6C1z9+Cz8ZxUY6jOmRQTyPb7/JjtwBDfsbvNKPOPxyfVbMTkQO9mq4B+RgsIS2x6R6HFyFURk
	1w5tF8na8FoQ5mnAZ4cmJtGLhDXZrNvNurCf
X-Received: by 2002:a05:6000:2311:b0:484:3a16:cc58 with SMTP id ffacd0b85a97d-486eb1d99a2mr7038096f8f.2.1789167537534;
        Fri, 11 Sep 2026 15:58:57 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-114-033-154.95.114.pool.telefonica.de. [95.114.33.154])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb330bdcsm9520289f8f.13.2026.09.11.15.58.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 11 Sep 2026 15:58:57 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Vinicius Costa Gomes <vinicius.gomes@intel.com>,
	Vinod Koul <vkoul@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Yi Sun <yi.sun@intel.com>,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org
Subject: [PATCH] Documentation: ABI: sysfs-driver-dma-idxd: Fix the kernel version 6.20.0
Date: Sat, 12 Sep 2026 00:57:37 +0200
Message-Id: <20260911225737.11411-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no kernel 6.20: the release after 6.19 was 7.0. The entry came
in with commit 8308510b9365 ("dmaengine: idxd: Expose DSA3.0
capabilities through sysfs"), first released in v7.0-rc1. Say 7.0.

Fixes: 8308510b9365 ("dmaengine: idxd: Expose DSA3.0 capabilities through sysfs")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/ABI/stable/sysfs-driver-dma-idxd | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/ABI/stable/sysfs-driver-dma-idxd b/Documentation/ABI/stable/sysfs-driver-dma-idxd
index 08d030159f0921b1796b19a0fa30e74c96a731bf..5be4e2d5775ff4c6e4bc82c92bf974cb8fdc64da 100644
--- a/Documentation/ABI/stable/sysfs-driver-dma-idxd
+++ b/Documentation/ABI/stable/sysfs-driver-dma-idxd
@@ -138,7 +138,7 @@ Description:	The last executed device administrative command's status/error.
 
 What:		/sys/bus/dsa/devices/dsa<m>/dsacaps
 Date:		April 5, 2026
-KernelVersion:	6.20.0
+KernelVersion:	7.0
 Contact:	dmaengine@vger.kernel.org
 Description:	The DSA3 specification introduces three new capability
 		registers: dsacap[0-2]. User components (e.g., configuration
-- 
2.39.5 (Apple Git-154)

