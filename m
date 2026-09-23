Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2033436D9E9
	for <dmaengine@vger.kernel.org>; Wed, 23 Sep 2026 04:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790137798; cv=pass; b=F7fo23vmyOVpP3UKfWPz2i7eGguuDbmx+VibByCOhydwguxtiAhvWnHLTbvw4bz9up8TU+fhI0h3bCxchJFNHDiNJVn0RBPJEtsWbOWigJ0SOaUJ6ROhxWvzA3JiGt9HphDXcBOQuKuL4XLS+Y072Hz57+hF7xcYtiwd+LOnJg8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790137798; c=relaxed/simple;
	bh=nLoZvuwVJI+OxiS9sqoT9Q2uJkM5dGkbMSjhlGJ6g6c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lS0b8e/vMoljOHIEuZt6AcbzOmzvyUrKWF249mfVootTcKzCgAoa92aiWtq+afOzgUdkwpEZiII+6qo8OmQqzvNNbdrJjiaNp+hnnv4I/bUaMZrOSvGYfTAQwPCznRsdKs/89YqlzXQkF0zQTCZBAENbgaeiYZHmCi0nuZ8gTqs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qYKjfYsf; arc=pass smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qYKjfYsf"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469a34908so387182b3a.0
        for <dmaengine@vger.kernel.org>; Tue, 22 Sep 2026 21:29:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790137796; cv=none;
        d=google.com; s=arc-20260327;
        b=Ik9T6684bSZpuTYvoexsp/WiuBOK5pYbYigdwhwQcOxEngl03K8ZyCRXuFWuI5xy8w
         /t3Q0tFNUBeUVN4ACy1IvjuYdp5tx7FqTNZfabfoMIzEfkddJj1qs4RW6ifL2yKAifl5
         9oHXXcveUgMRjg6RLEIgGXEIoS0E2AssawFhs2e/sDRtv08uPsw5E60iFVNrNttn2x8n
         xmI//uzA3KBa2izSVlNk81DH3zcC8dWBvhHmvkPxyI9dLpQbTul/wEJKC2c/roB/PSwi
         ZnWBTFNNWGNyFpVKe51K7zRX3i536BuXuek6nszjA+la1jq4gBqPo0LJUwU3BBcprle3
         iX8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nLoZvuwVJI+OxiS9sqoT9Q2uJkM5dGkbMSjhlGJ6g6c=;
        fh=LrM3G6RcmBZ425pLRY8E44TM1XcCb9gU9D3viVl1X8E=;
        b=AoX6irV/PeP26udAWi2vTbegwH02GWt8czQ8RIrBN9be2PPiRM6eK7aSq3Lmz9jSMH
         Dnuxeaev95mqXtkgManpaGNQj30zFm5heOIVsVtVktlyepcVeMz3nigupIiJGROyxwtc
         mUZ/wr9t/DU4fG3rc3BYogvmr39qxX3ZxWQLLnFNLB0iR0yPZtvXVdkm4Es+qyyPr2eI
         C4o97EHOWwcXVDgQrwjtQYt6w/FE7sCyrVvP5P+Y0XqT9nteCl8KDscjSfouwdJ4fEnv
         3NtFsSRtJU8hstH9wQFYVLNBYB1sPBtBXYpBph60bWuGxR1yS6SsEeXAL7tybidc9g4I
         zc/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790137796; x=1790742596; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nLoZvuwVJI+OxiS9sqoT9Q2uJkM5dGkbMSjhlGJ6g6c=;
        b=qYKjfYsfF+xgyHDJnMkA7e/VrDChWx5AuS8ziMsefk/JDAnogHrjrAl2JmYtJUjYuP
         EyZDi3LfGXyteZSOBgMiJRkVpzwY2WtSh4INcpR/zTU7c37aQYhjgzu45GsCP/0nVEB5
         MiBe5Uisk/FG2Q84pmT78iAbyLzJBUuXkwngaS4RA82XksGOh8hpTjzi+JvMohRmXWjG
         T7nCBcg22pNZzPdeYg6F3ufpmg6sgICC8VYCmrwrhVcHrVD+axlYDctkvBPMM2fWukT0
         7BQhvdD90Jq49iD+uim1UEis4JylAqwFJJA117lI2L42fKmADDOREgxixwByZznMb7DC
         +WYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790137796; x=1790742596;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nLoZvuwVJI+OxiS9sqoT9Q2uJkM5dGkbMSjhlGJ6g6c=;
        b=spV53JJKVw0krEkkOcOKkFLIbYC0EGPt5gYPrL32DXYoT65Kv3qYLVepwHa7ZFniPk
         sJC+4pnhpedvQbFckRoI6qsNrCPl6oVraJdPvxcSkrgg20s5BuATeoMvNqYsGxx26XXt
         g+aF8YWRuZlIZD6MTuoM2h4sCdLItjAi6Xd3G29aK8FrGE4i5qozLYeF1jYOqHCyemex
         JPHSYFS49bOisW7niMElaBpG0Ag0zGitXOtzszTbs/Tn/MfbvivZBFaX+fjHrGropmC1
         xiNtudYfbSih2daocfF6YecH3GmPlF7qFSySwLkIN4CfHyt31DfKuamx7vGAc0fYQNEf
         +I0w==
X-Gm-Message-State: AFuF++kFtK4jv5xsUID8X2nJX/pofBoBpVhNT7TADDFYZ4ho0EpHwv5Z
	SVynTycCT7XpV8o4a0roPJZpK82+73Vsx9L9rcTqupo9j3Auzvxb+xYLHubelbvOYc4rsKO4NMC
	JS1XO2yuBTZk3sJuRv6fPo7u/L2q88yc=
X-Gm-Gg: AYBFou1Ye7PcN1uywLHIy9KRBujsid3+c4CwhuEDfthfqt7Dpng7yZcAaEEZdIc9FqP
	IuwmqzzVqUmxr3+ZK7wz5Zd7Ve8PRG6k2HnnGqEXHX87KxntKL54WMMN1iKgM9C2QlFBCLhAFDu
	t2GF2Ca8yal93PzYnpuA0oi0lnaKhaXEeTciqqE4bIgD8Kenk4MAYUUcep8gGPwJlf/mg21fpTN
	lG/aYOZHkzNRoEnREtjLwSqvj/K9RUiPtEJ9iLLbXF7EsJp/tXAk9rO/ruKcv24H7UujyerIwN6
	wNSyn2DsKKGtl86jzGTRAw7TSvk4EkIshUgqc6FBCtt3+vrKYiZtjQBbjPR5YWS9iE4jxkvvCDw
	rDxRz9q3M+uaK0Qd2hwsYAn0U1/+7WcDV0g9uapFAUDUjjHyLDvEV3uqDFkz5Zmo1LbI=
X-Received: by 2002:a05:6a00:761a:b0:87d:3894:196a with SMTP id
 d2e1a72fcca58-87d389421a3mr1066998b3a.57.1790137796397; Tue, 22 Sep 2026
 21:29:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923040831.10936-1-phucduc.bui@gmail.com> <20260923041639.1EF301F000FF@smtp.kernel.org>
In-Reply-To: <20260923041639.1EF301F000FF@smtp.kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 23 Sep 2026 11:29:44 +0700
X-Gm-Features: AcwNN1Vvzt3y8riuWi4-ytcJhOf2WBYBJ9_lqO28wVuyCEhFO5pzOTb8nqKb7bk
Message-ID: <CAABR9nHHSJPcdBwY82jOZG7HWs4FKbzPF-rckz=T+NTEKHj-DA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dmaengine: ti: edma: fix pm_runtime usage counter
 leak on error
To: sashiko-reviews@lists.linux.dev
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
Content-Type: text/plain; charset="UTF-8"

> [Severity: Medium]
> The commit message references netcp_probe(), but the patch actually modifies
> edma_probe() in drivers/dma/ti/edma.c. Could the commit message be updated to
> reflect the correct function name being patched?
>

Yes, I will correct the function name in the next version.
