Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9D343B6EC
	for <dmaengine@vger.kernel.org>; Mon, 17 Aug 2026 13:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786975056; cv=none; b=g+kXdwqEmi7E2dxN576AJDzuU9NMWk9RGdDySijIUpOyJUAMcvxBGZ6LU1+NJz8kDV8/p5GpUG18uQeTIPQdw8LUBgvZw4oj+6FZHrXFaxDImGcIsENPrcNLEy+yibPvWWF5jyC7+mojaxyCq6W4BGrwnDrrdJF5oRc6xlYjjbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786975056; c=relaxed/simple;
	bh=RGN10SVXvm3i++Bfg+6kRY/5FXtYBlYmz8CMVkacggg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d02+UDGZ36B0p+//WaJdhVNJYSWHTUdSiV/CM9PMsuNE74y2lbHXZIJjjwyKgSV28SG47yfe4L7sqGBaJxe8yVSFN7DqsZA3C4/ucixFSHg4aKvsC2f43tJZClsNyThNq8V6kAPwXb0PHQRTeOERLtIaByh8ofA8uKGsLC+fJXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=soundtrack.io; spf=pass smtp.mailfrom=soundtrack.io; dkim=pass (2048-bit key) header.d=soundtrack.io header.i=@soundtrack.io header.b=aS/EKbIz; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=soundtrack.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soundtrack.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soundtrack.io header.i=@soundtrack.io header.b="aS/EKbIz"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a18d89e4d9so512597a12.2
        for <dmaengine@vger.kernel.org>; Mon, 17 Aug 2026 06:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soundtrack.io; s=google; t=1786975052; x=1787579852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p4sFYLrF8YcFxl1e2AvAjI7qSfV6fkkSPS8k5RbbIFQ=;
        b=aS/EKbIzhmsXDmX3XxlpsaeofNJ3WvnoPVwcotfAToFCDLm0Qi0/zVUZtbaL7DiEbi
         Ywh+K88Bqf9jFXrgmbpovU+K8Bdja/vR0fIPJoXpyWp7efhKgoqwO0TnmrVF0mfgXcxZ
         k1F6xOKUZbGUCMCaH7UjHOFuQ+OvYSkGvSo7V0aHZlMmMzwplzsnMuWEcWcqjq3v6dzW
         nAdrmP96ahDg2N8Frq1ht/E72Ukn0ugGQP2/d7y9tryPU+2wKxfnxOrSixYj9v26sepg
         1/zvWoF75CW4qFOKQyoHt1N2asFcjD0hCB5PJRrOAb5BIjlOMZG17Pf0oEC37iNSIUI8
         OF5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786975052; x=1787579852;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p4sFYLrF8YcFxl1e2AvAjI7qSfV6fkkSPS8k5RbbIFQ=;
        b=ajQK4ST2+DLo3S/qMD6PUavKzgbjt/kP0GBKRNdQgq2zPd5f5UT5H0U/cZBr7jEyUn
         VyqI/S+zEfPR8mStcJlbJphqG2S2pvkP9bUr9xuzjwbh/1CHMCoeTK0EUP4QgCk7z4OG
         0IYwIhv/EfadNgO5wuR5k/nqjOutTYxQlLVWOkLw7Sp4o17GGQS4EKzBIJrVicKd2WYG
         B3/5PuuZMG5XHM/cRLrUOBUlRhvjTwhqKbXE1uopF/hBGHAl8O609+7D+tHtw6/BCAJ9
         3OnFhhzuSH4wod8clgbmlEhl8rpbPUoK+jm8h0bUa8MpVJunq6CJkBQB1WzhpQmpzkWO
         5AuQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpqx5qfICBYrqw80PGiw/t2YEBe5NON9thHQayk/Qhch/oLeywFrWR452wXaVKJRHBGTX80XUHfEWw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLi87F62V50oLziHrjfsHzJfAquqIGvfn8Yfhx5vZgsPWAkN3O
	ApcvbpbELZ3r1r6M149F21W+73w4wh0EMZNAzh/p7nKDcLmaYL7RpxabKWt59hLrXLM=
X-Gm-Gg: AR+sD13zjm59i5Eh3hn6OjS2CF56HAdSJQ40QuT2p2Ylp+Z1eBq9tzyZe4QEapZx8PL
	/yqkAJ9WyhgoT+IRvexHkd2WroauJOAndSCvUNtB0O+uLbsvkZDSUtR71KB4SPDOS3OHotJfNPL
	QTflEqq1Ln8BNB7v4Qonr7WvXGVelqfWEEtxzGa/aOXlFGASMGbCNJ1m5gwme0Us95ucCzyodVv
	MLrD+PJdBUeYkoR5aRgTh5jr+zplJagAOx5atxqF/bF28j3p0IOQLO2G5Z0raON57QsF+AD6N4+
	rVzbQiyzvPNN9QFPZtNmdqtKmeYrAqUqkj8ZfKIzRc25ZwqD4ecZ8JIgNACtPdUS1Kjc8sIcR53
	+yuoIs9SZJ/WRWSdDuj/EeYdJkpcPWU2/fkg1CeFrDGmJQeBe9qUkgstfrb5zTFK8fv5/iTCzW1
	5BThkJrVJGkpNtlGe3JtFCftCziCTOoaG8Rc9m+U24ydgFpg4V8h+7CXf+dECEE17cv+yzGRbgC
	wVydY51Izv7E5N61wX2gIHwmbwd8lDOtyxuLq23AncwKinlDNligutza4g=
X-Received: by 2002:a05:6402:3888:b0:6a1:8d3e:ee77 with SMTP id 4fb4d7f45d1cf-6a38a8b7c62mr6178631a12.1.1786975051651;
        Mon, 17 Aug 2026 06:57:31 -0700 (PDT)
Received: from Mac.localdomain (31-209-40-223.cust.bredband2.com. [31.209.40.223])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3d85319b1sm810238a12.13.2026.08.17.06.57.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 17 Aug 2026 06:57:31 -0700 (PDT)
From: Christian Lugnberg <christian.lugnberg@soundtrack.io>
To: vkoul@kernel.org
Cc: Frank.Li@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Christian Lugnberg <christian.lugnberg@soundtrack.io>
Subject: [PATCH v3 0/2] dmaengine: sun6i: Fix two bugs in the DMA status path
Date: Mon, 17 Aug 2026 15:51:21 +0200
Message-ID: <20260817135723.12807-1-christian.lugnberg@soundtrack.io>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thank you for the review, Frank.

Changes in v3:
  - Patch 1: trim commit message to the root-cause explanation and fix
    description, dropping the debug/reproduction part per feedback
  - Patch 2: unchanged since v2

Christian Lugnberg (2):
  dmaengine: sun6i: fix non-atomic read of DMA position registers
  dmaengine: sun6i: fix undefined behaviour in sun6i_dma_tx_status

 drivers/dma/sun6i-dma.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

-- 
2.54.0 (Apple Git-156)

