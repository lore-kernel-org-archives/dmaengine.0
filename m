Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA52346AED
	for <dmaengine@vger.kernel.org>; Fri, 20 Feb 2026 13:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771594138; cv=none; b=PNEllNeqcVjZzsq3rcrLsk2R8TojYj9P7PjKMYQ21O8Sd3gxBKdb1CdtGQSW3gFjhq0WPugV31e4jeuYOO8PIpEsllN/mw6KjxY5jSYWeDtDE2nXApdZACyhBWUZjazN0+cs8wscNEmKqh36lc4cv7LVYpEiyGN5TVD4FC6UrGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771594138; c=relaxed/simple;
	bh=5t9WrkC4cTaT4b6ayhskebEanP2UOkXXIMsIizLdDAg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FsN36ulTru4l+jqXaq2uz6u6VXX83Cb6Y6M9GXE13wX/MwOnHOnmVAnO+NxcLI3co6a9hO+S+cnYWXVEaeVNqg+BrGiYTrbVZmGo2zfRVpTSMtgrzZ7XXSCToSd2shbLeUk6gdNjGFrdKVIFXnhiql8UR7ffEGyOSSBtVB/aeUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SsM93OTH; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SsM93OTH"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-824a3509a12so1179656b3a.2
        for <dmaengine@vger.kernel.org>; Fri, 20 Feb 2026 05:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771594136; x=1772198936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5t9WrkC4cTaT4b6ayhskebEanP2UOkXXIMsIizLdDAg=;
        b=SsM93OTHpJhpvz9tQbjYkOz4QkEoFQiCcUhSBobFQAEzzxVoBE15gmTNRAEyUKH3Xk
         ot+Mon3Iq0G2fesknw6luZJrqgQX0ioG7HLnjCxGEd/LDqwUYpafDy5WNMa8yq97V/Tc
         4TdZQ9mNVQDJVn7HgOnKm0XT2R3Abool8eDR3bG/USFnVudEZNSNc8h7b+WEAdilBhPp
         wYPfcHsL7+EMQNg7U6a9d+uVjW/rzGX/HNeEEBUXgelxFByMfW3SKaP5fTxe1C3pdc7j
         Cqp8eZor10BwlcwWNVYOoH4WqkxvH1/kEh7Ky/iACjoJBwNf98CBc0SAUH9oY1ul9VDs
         QeiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771594136; x=1772198936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5t9WrkC4cTaT4b6ayhskebEanP2UOkXXIMsIizLdDAg=;
        b=F+GYAFDLPt7Jgeyu/FI3VxFBrv6tnkDcXegzQa5FN3c4/PcsljrsCfZc57FlscF2b+
         Q4pCIeT0SD38kQco/jmTFFeApFKWJIYPbYW/wtMr5Y1NsN+56YHm3qfl9IO+/P+IQcry
         eYNHn7uQhGy9dKgaerLLfP15+69T1w7Q1UH6XKnVlUUXoGnjCgw/GX31vmZX9iiPGh3x
         nsaGX8vKGy9ArEX2QTtBMNxS13ckVBtj25vhHeToaN8GV7mzGdj7VDphyXTI2lYImjxJ
         TfvFnMMsJs3eyS3D2mQcGJyGRLKtro8w2ePf4CDusOsx/HSmOX6xeTLsNzHQ6qH6Ps7j
         iO7w==
X-Forwarded-Encrypted: i=1; AJvYcCVz1yMUmjiJxWqG2LfetdroStvQ2i+n5aiIkMiHNXuMcvVZJjKlC8ULENQrJW9umUvPmwjTaeABtTE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9lmWl0+coW48VJ7y2q6/oy4CnJ0ptIPzhiKnW1lfUKvBu6a+W
	cL/Ak4H0nwvIAHdNXjerfbK6EjNHMQWu9aQAyGCWNLMGBuNkeLXVZaMY
X-Gm-Gg: AZuq6aLAvzBk3V7PMhVEvoCL2THg48c0sL2+ig5U6yU4CBgxLZsoeg/pbasnlM6Aa60
	LPrZI6gAjWERZocociEzpnN/ThS/I5CRN+02N0VYbi2A0xw4pmaMoGvODn1PHpiU6pOlEC2cAzf
	KFzOhk4a7GWTbh1u+MNwUjUUmkFJRxYGCqbcu66kXLX621dso+wDsJ+tVlxQ/SC9cO5dk6aJc7a
	DT67Er63r8le6cgHW3xlMxl2iln6X3GAsc6jDxYcwQPRg3D2CdfycY9Iw53+mFYrcnvSTWLyaZF
	uQ2qqSNWzKDilfT+DZH9hxwkagvWrD5+XtXR0hcEB07SC6t0NrGgwVfOwGZJjd09PXzs2BmrJe4
	abUEqjcJOypUc51Pz4gKyU502GEMEsAzHA/lMgDBZFCVx1kz93FW5eOSNEEOv67nwfrZSvbJFKN
	rUbdzj5YV3p02HVE3IGOBI/v+0KwmOAqw=
X-Received: by 2002:a05:6300:194:b0:387:5daf:b312 with SMTP id adf61e73a8af0-394fc1f781emr9123102637.35.1771594136314;
        Fri, 20 Feb 2026 05:28:56 -0800 (PST)
Received: from bsp.intra.ifm ([123.252.218.194])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e5331ba14sm18575123a12.29.2026.02.20.05.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 05:28:55 -0800 (PST)
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
	rahulnavale04@gmail.com
Subject: Re: [RFC PATCH] dmaengine: xilinx_dma: Fix per-channel direction reporting via device_caps
Date: Fri, 20 Feb 2026 18:58:44 +0530
Message-ID: <20260220132845.7118-1-rahulnavale04@gmail.com>
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

> Can you help reproduce the issue at our end. How does your setup
> looks like? Is it dependent on PL design ? Unless there is some
> dependency I can try and triage it.

Our setup uses a custom FPGA design with a custom XSA file for the PL.
The multimedia drivers (audio/video) are also customized for our platform.

Regards,
Rahul Navale
