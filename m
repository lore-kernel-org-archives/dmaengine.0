Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794267838;
	b=FaMqKeNMIqOM0x6QHBNeqjPIV7Of97qallRfBl8q3HzqudD81Ottpb8XbrVMXbPWZVct
	 T5gUrB8gy1C8Bj4hz86XNGENses3ckKPAoh+7IEwgYkFE2B8nQdNFdgLj3k23Br6Ai/h7
	 rlIP5gczL1pJKfjm7GWviKeqnCq/9wvlhdTOTz0jlyH2pMALCXO6N7DoU7Zl258O93r1B
	 XNDJwaQLl0nxka15VebsgyXm38m4gFQ+I+eDo0zpaltuhQJlUg8FnND704h3MB1uhY0cw
	 77fX7S9DO4QytCBG3gQwPvwQH5gqL9/AwiTU+mAyPZrEvpZNWRjDu+Sbs+wNaGBFbOg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794267838;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=qbotr9HsG4F8SOuvQwl9pplgEz/kcu/6H9npIEXtgH8=;
	b=au405lKITiy1VsLkpcfX8cy6y9TAeGiWBkHteoMhGS3hrzjY3Bzlg91Ukpw2b/nnivl/
	 bHykhJWp5rMzCNjfasZ8jpKLpaQf9P7ZkCz4BWZVqBwGx0osz+30MBi5bIEKOH61XgBYD
	 HDjgYj9IkWSWLbqRSyqHvZahvsnuTpEoIujHgXPCPJqoEVkO9DekXIaRc1bY+ZDHxyJm/
	 2F2UziYuy4+FNHOJ4FRaNzO4puUJihjIoOB3Qf0Ci/MVt+WxyPCg47IGez9XZAoxTVMY/
	 Okxbl/KbmObZKirejFn0XBnhFX7YnWLxaJ0plgOBG9g1YGbBicTyJvxDv71ayINuo1g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p8G+mgms;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E04606A31C
	for <dmaengine@vger.kernel.org>; Mon,  9 Nov 2026 23:43:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0E04606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p8G+mgms
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e977109392so8278095ad.0
        for <dmaengine@vger.kernel.org>; Mon, 09 Nov 2026 15:43:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794267837; cv=none;
        d=google.com; s=arc-20260327;
        b=iQ0bczSj/7PLigSO4t42CFF+1PNVIDPmDg5Vb4hwjsqSlJseY7Ndh9ob+O1GSDclso
         NR7XJ9QOwVzqmOi1gfvFew4fSf3CpK426OSZydjmrw0FVDXkl3ubxGR0iyIQCizpdLhk
         Ib786hdv7aloMCFQ2ZHYmovDNrl1gWKnb4TIg2tPq1jG7bPe5G1kacLed6SmCuLNW8aJ
         mjFW9rSVFSFJ0YR9Z3hncYufb7Ug6f3gEZLDWKzbcwCg3IVRD9vwH9cfV2l6UH5m9Sn9
         E6QPs514eaqZ0RVPkK2JNfGbH7q9pr05jCXgXI9Nx3aeNuT8gbBmkCQRXDJjmvrWsUvg
         MBiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qbotr9HsG4F8SOuvQwl9pplgEz/kcu/6H9npIEXtgH8=;
        fh=q1opke/Aw0qlKdFhabuXg/K4qnIH+gyMtc9I8g+W8dg=;
        b=iLHsHAqdcDDT5K6QbmsKRBdLKN6rL/rDqA7zBdiBiuG8+dTAORB+VfTfl5G0q1MR3z
         +6LJWVtQPUo5vTBPX/vmemQMGc6mlb0iCWU4VHUTj/X68cCSBZ8lA80xYBLSj73+u+bp
         3e/HTuVinp2o4V2fG8gAxYJIOc81xP64xR3Wm/pqpeFy0+G5d3HDGdRdyZ/TrbeMqztD
         NQeH0bWUXrhlRckDg/sOt4j+rik6ZWhRKD4YqR8SS0dtWioK5tvSNzYHKLcMys28XYD3
         gjj39mkp+ZswFUB31U26opHxhGxPJFm8G++zIJCsu4DdqzH4O9mJAt1nzphUdFh+G0PQ
         jDnw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794267837; x=1794872637; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qbotr9HsG4F8SOuvQwl9pplgEz/kcu/6H9npIEXtgH8=;
        b=p8G+mgmsN+1+yeTonrlxR+6dJybCBUs9uYgHeZROgvnKgAHjEsg9S5W4Ej6nai3GJB
         j4fXFMRB+8ualdi4CI19VsIgnnDaCVJPQCdc90tpI26tE0XdaIAmv9rlFrCAOhWsmgCY
         tBU+3PR3rdsxWKnnvUU5aysyDghmJs4y9UzCxqU8iq09FakGCC4RfzmqBF9PMppDk92s
         YwaKfYHx/h9ggzQ4l8XJgHKlcuU0bPJnC043mpB8gMFdS6PVOv3IjP9WaQyOL/6oVfj7
         FRNFaoP+10Geai+I92YXUQz8Sw9spNE0q2ExXdAcPN+wax+MXkESfQcmtDhhLOdUTg3D
         2tyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794267837; x=1794872637;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qbotr9HsG4F8SOuvQwl9pplgEz/kcu/6H9npIEXtgH8=;
        b=rCHan6NFxKUpIsZwuk6pC0fu2DfraJFqRLXSFmJ1DQY7ZxSUTvMLVCyztU2iZkjARL
         ANnEf8Iggc+hRQoyZlfRJ5P1LSUSVW3o6MEejraZj9Y/QkW5v81L75eGzeQPRTdEEf1T
         VkBEBBm/oA57VKIWI95ndwV9g4nzLWLH7mR4yGTt4hxpMZg+mH0iKy4GxEf6FGrQof/S
         IF2rtqlafzJcG4NodbQU2M0TdyGliMkPpx9GIoPkoB8nt5r93CbHBgO4japebaPsWIpO
         c3HhdnVN1ynsvuCqOAhuhepR5Xtd+HZ+MoxSD1gViYB5cI/Em0UdFM/wZSsOO3KiA5mQ
         ltZA==
X-Forwarded-Encrypted: i=1; AL+hErEZhcuDM98pvKzVNqr8tE8+0h8anPFbkVW+a3Z1DseHuO5Qzes24RDu52fkqEDFCN2rmO7qOGguCmU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Tt1+Ti9V74Vma5d+Ex3K3aDeB44JzpnIkjJgacNETyCJKs7xU
	hjruWPYrCe1BQMpCU+3imp6I9TIMj1pp4MJxdAiuklpbBhxoqmyModqu8h7VoZpx1Am1mpKgVIb
	bLwdeywPxCbtK91HidGLIQGjc3ByQtWg=
X-Gm-Gg: AYBFou2vCLwCGr0XB+W2zltcuB0dW1TJcfM6PcZtILP9O+7h+aQ6/OgXCIZHIbH2YUI
	Y7LPS4cHM2E+jfv7u3J3eA5hZ48bJDmXuV/D0ZROmOQBzGTGu+PAm01csEhg2xGQX+hMzRDFB4O
	BwaoKjntnTEFValgqAA77nWXGRiGvqPkKjDWT16huTto4GrYZs0F2lRFr6FS7mYFlNLFOuQBYTO
	NNJGKrQgBjlncIrUcEEYyQDPIS/iEsY2WaGiSr3UXWmneoiz62TT3HMMkTg2HRR3GBC7RV4QLA9
	EuLRrhIcSc3LHJDL7PN2gzc3vAZKubGCRWJE6khy9r78jVq3NVsMNwBO4+1kSdBn8XlQA/3peKy
	GYpzMGPCcrSQhNaUxL5s3dUpIgCjMvx4i7GJ+O4jEvWzVSFfLJi/nQfO6rc+IxmX5qSaF+iBeDa
	9Ul5qwbyIY2D1eM60=
X-Received: by 2002:a17:903:3708:b0:2ed:4c7a:31e4 with SMTP id
 d9443c01a7336-2edb8f95b9fmr6762265ad.1.1794267837146; Mon, 09 Nov 2026
 15:43:57 -0800 (PST)
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1785183549.git.allen.lkml@gmail.com> <cover.1786384168.git.allen.lkml@gmail.com>
 <auv5LFaju515uVLM@parshuram>
In-Reply-To: <auv5LFaju515uVLM@parshuram>
From: Allen <allen.lkml@gmail.com>
Date: Mon, 9 Nov 2026 16:43:44 -0700
X-Gm-Features: AclHuK_IjqiX83c1DJy_vDMRHUU25ZAygSTNNSWEu7_KJWWcXOL9A8rZkK2Xack
Message-ID: <CAOMdWSKMJXPHoKosF6HrGd5o0CbdxeQF5qgCMSvnZqjuNMJubw@mail.gmail.com>
Subject: Re: [PATCH v3 00/34] dmaengine: migrate channel tasklets to WQ_BH
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

HI Vinod,


> Hey Allen,
>
> Any update, I am looking to pick updated patchset for this. Can you post
> v4?
>

 Almost ready, will have it posted early tomorrow.

Thanks,
 Allen
