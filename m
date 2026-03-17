Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E17365A1C
	for <dmaengine@vger.kernel.org>; Tue, 17 Mar 2026 10:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773744589; cv=none; b=l87ZbgGnOdVRS91C7rV0TSHGEt1u4BpZrvu3glFIsiFOd6kkrU4ADH9qUbVz8EGvOCg/4tCQqPuv/0cBYhP31Df8dHcdZ0fJVWFQWCBG+/zHzs8h3D4XmU2xqwJtyauRZf2XnZ0XNrSnbRuw5Xq3iRN3ZhP2y2bn/HrYiLdm8Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773744589; c=relaxed/simple;
	bh=+cfs0t0LmSJY4mOioX92eiqEvpcsRdD7gJt43vu6FJI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mef0FnE8AgKpxe8ClRoo9HAyFwjkfqqxZIX6O5Wc+6xNIE9pk16lcCe1Y+pcJtqc/9CHjGc2vosRr3s5hGWzxbh1h9FQnO3L03myyHIGlmteNd4QjDs/7BvjCZSiB3munZ5Cxq+ALuqm+ZkBrVdDKrdNF4hOWuRD853d+zRbIPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nivb1TaT; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nivb1TaT"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-35b97ed057cso1334207a91.1
        for <dmaengine@vger.kernel.org>; Tue, 17 Mar 2026 03:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773744588; x=1774349388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+cfs0t0LmSJY4mOioX92eiqEvpcsRdD7gJt43vu6FJI=;
        b=Nivb1TaTLo/XQZgubyoOxkSYr4GN7Rt53d3YBsh3mCZnbxol7KhVwC2O0wZIbfX1V0
         csubDAcOrdawvH6Igw93W2rIzaGdLcjnJJhUPRcJs1qOfB5r66RiDbGYWGWO2fJdr1Bz
         D59zCMqFZB/oOOPhMrkwa1/tQ/WIK6ANEZefNGz4+c8VeHeTbD9D2AzuEjVii/3X37Od
         Msxy4OjSO/zvWptB9aFSfmEvi3Vx3AM6BCbLSvPVoz9hRjykCIQeMQOcm9NQw6W8z902
         QO/tnXQ+1UANvbXEcp32jxmgucsOP3xC+ZAkXsqqqYv9qz49h3ovCsxmldABJgoPkmKw
         n/7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773744588; x=1774349388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+cfs0t0LmSJY4mOioX92eiqEvpcsRdD7gJt43vu6FJI=;
        b=BXIINzDe5q8TnR57c9WIJ1jGYE2SdSuoZ89k1wbSQ/742z1CMV/QDKxYpnI+0hhGOi
         j76dbax6Nqdtj8yjaePTVTxD8JK1jGIVx1iq5FOXSFAFykAqoPpInh4ass95aX0hYTve
         hnGlhkotgnOCyatwP5tozfrBKRSkt/2DDo1q0lT0l9kXWzXawKnMvo5Uw+ZusyYcbyDy
         bmpx80jCYyfkOtBZr2StjwHiZxy2kWhg5dZaXzDiDRdYm5lOzohhWIjpvYu18rnRe2NV
         ZsZWuZ0LKprAPPziFdsIMtlN6lU6DLqABmzzRmQXNLQ5kmWxovO2hPE7MIJAcZS5ZdQk
         Js5g==
X-Forwarded-Encrypted: i=1; AJvYcCXYQJfJU64L/aAEU20ORh+3nvO6G2NvivNCjonRtJPN2tRP5CHr2qGEFTmnKdy8bNe3aqGabbTE/+E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8gl8VzbX3H2PQPQs83mPzv4X0GNkMCeyBwuk5YH06UUShoCU8
	6MIJL4Fftd4KknYkPeBu6QqYi2APPI9+iAGZj/rCuYzVREcoyG2LAkHH
X-Gm-Gg: ATEYQzzOHmoPNAR3j6K3yyd4eVtdyTTEyLwOEUVgLxzwewJqfBA3zsQ6kQJUz1TA7WF
	czU/gWXw9IkdGaH9e5JYJtorc7tKPD5egLaKuuyOH2nTacdVp/MVP9u6T9g9k95hwXWRT8lmckA
	iR0pizNnJJg6B1ad3fsybG6uMa8FuJIgra4UbcsL/RNkpVxlqY0WRPnjyIG3ULy7cu54FyKCyko
	otWwE3zSdFzGvpRuQBQbyK/sWNbGWp1lp+ZX0ep4hucTIehiY4NT1LzYKQfiaL7GeF59jVE1QJw
	5eIoEGOF5OF2nOSm7F+R3pxExf1k4WU0F44hzFjnrMRmQQ7gsAu/fBxRAo9wsHJSKCmVZ4Ldgjg
	YF9fiRMjDY5GGxN0+oQ4QplrMjJL3//5gD4M1btZCahN8YmKDsA+CJPe5HXq5nRyIXwEb5kpRWc
	Z03IddhqtGeg1m/+wy8hTrfA==
X-Received: by 2002:a17:90a:d408:b0:35b:a9f3:62ee with SMTP id 98e67ed59e1d1-35ba9f36aa5mr3331138a91.27.1773744587612;
        Tue, 17 Mar 2026 03:49:47 -0700 (PDT)
Received: from bsp.. ([2401:4900:54f0:3ab6:58b:9924:8921:710a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35badb90b8esm2529439a91.11.2026.03.17.03.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 03:49:46 -0700 (PDT)
From: Rahul Navale <rahulnavale04@gmail.com>
To: Folker Schwesinger <dev@folker-schwesinger.de>
Cc: Rahul Navale <rahul.navale@ifm.com>,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	vkoul@kernel.org,
	Frank.Li@kernel.org,
	michal.simek@amd.com,
	suraj.gupta2@amd.com,
	thomas.gessler@brueckmann-gmbh.de,
	radhey.shyam.pandey@amd.com,
	tomi.valkeinen@ideasonboard.com,
	rahulnavale04@gmail.com,
	marex@nabladev.com,
	marex@denx.de
Subject: Re: [RFC PATCH] dmaengine: xilinx_dma: Fix per-channel direction reporting via device_caps
Date: Tue, 17 Mar 2026 16:19:32 +0530
Message-ID: <20260317104933.4846-1-rahulnavale04@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <DGHGTCJRRZCW.9TGXQW44V6RR@folker-schwesinger.de>
References: <DGHGTCJRRZCW.9TGXQW44V6RR@folker-schwesinger.de>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rahul Navale <rahul.navale@ifm.com>

Hi Folker,

>Just to double check, and to make sure the regression you're seeing is
>not a combination of any additional, yet unknown side-effects, could you
>perform one more test?
>In dmaengine_pcm_pointer() (the function we just patched), could you
>replace the call to snd_dmaengine_pcm_pointer() with
>snd_dmaengine_pcm_pointer_no_residue() while keeping 7e01511443c3 active
>and test if this fixes your issue or not?

I have performed the test (replace the call in dmaengine_pcm_pointer()
function of provided patch) while keeping 7e01511443c3 active.
I see issue is fixed audio is working with this.

Hi Marek,

>I came to the same conclusion, that the residue handling is broken in
>the xilinx DMA driver for cyclic transfers, and the fix is below, with
>two extra fixes in top:

I have tested the provided patches the audio is not fixed with this.

